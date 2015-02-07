Spree::Product.class_eval do 
  belongs_to :company, inverse_of: :products
end