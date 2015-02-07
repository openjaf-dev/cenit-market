class CreateSpreeCompanies < ActiveRecord::Migration
  def change
    create_table :spree_companies do |t|
      t.string :name
      t.string :business_type
      t.text :description

      t.timestamps null: false
    end
  end
end
