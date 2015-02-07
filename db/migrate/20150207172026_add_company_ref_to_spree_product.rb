class AddCompanyRefToSpreeProduct < ActiveRecord::Migration
  def change
    add_reference :spree_products, :company, index: true
    add_foreign_key :spree_products, :companies
  end
end
