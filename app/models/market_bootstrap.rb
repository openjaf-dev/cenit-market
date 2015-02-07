require 'rake'

class MarketBootstrap
  def self.all
    load_spree_seeds
    taxonomies
  end
  
  def self.load_spree_seeds
    Rake::Task.clear
    Rails.application.load_tasks
    # don't prompt for admin user and password, just use defaults
    ENV['AUTO_ACCEPT'] = 'true'
    # temporarily redirect stdout to avoid "loading ruby" messages...
    $stdout = File.new('/dev/null', 'w')
    Rake::Task['db:seed'].invoke
    $stdout = STDOUT
  end
  
  def self.taxonomies
    taxonomies = YAML.load_file("#{Rails.root}/config/data/taxons.yml")
    taxonomies.each do |taxonomy_attrs|
      taxonomy_attrs = HashWithIndifferentAccess.new(taxonomy_attrs)
      taxonomy = Spree::Taxonomy.find_or_create_by(name: taxonomy_attrs[:name])
      taxonomy.update_attributes! taxonomy_attrs.except(:taxons)
      taxonomy_attrs[:taxons].each do |taxon_attrs|
        taxon_attrs[:parent] = Spree::Taxon.find_by!(name: taxon_attrs[:parent], taxonomy: taxonomy) if taxon_attrs[:parent].present?
        # don't use find_or_create_by, need to set parent before create so
        # Spree::Taxon.set_permalink is calculated correctly.
        taxon = Spree::Taxon.find_by(name: taxon_attrs[:name], taxonomy: taxonomy)
        if taxon.present?
          taxon.update_attributes! taxon_attrs
        else
          taxon = Spree::Taxon.create!(taxon_attrs.merge(taxonomy: taxonomy))
        end
      end
    end
  end
  
end  
