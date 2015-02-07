class Spree::Company < ActiveRecord::Base
  has_many :products, inverse_of: :company
end
