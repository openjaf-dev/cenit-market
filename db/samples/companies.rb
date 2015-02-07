#require 'ffaker.rb'

products = { 
  :ror_tote => "Ruby on Rails Tote",
  :ror_bag => "Ruby on Rails Bag",
  :ror_mug => "Ruby on Rails Mug",
  :ror_stein => "Ruby on Rails Stein",
  :ror_baseball_jersey => "Ruby on Rails Baseball Jersey",
  :ror_jr_spaghetti => "Ruby on Rails Jr. Spaghetti",
  :ror_ringer => "Ruby on Rails Ringer T-Shirt",
  :spree_stein => "Spree Stein",
  :spree_mug => "Spree Mug",
  :spree_ringer => "Spree Ringer T-Shirt",
  :spree_baseball_jersey =>  "Spree Baseball Jersey",
  :spree_tote => "Spree Tote",
  :spree_bag => "Spree Bag",
  :spree_jr_spaghetti => "Spree Jr. Spaghetti",
  :apache_baseball_jersey => "Apache Baseball Jersey",
  :ruby_baseball_jersey => "Ruby Baseball Jersey",
}

products.each do |key, name|
  products[key] = Spree::Product.find_by!(name: name)
end

companies = [
  { name: Faker::Company.name,
    business_type: "Manufacturer, Trading Company",
    description: Faker::Lorem.sentence,
    :products => [
      products[:ror_tote],
      products[:ror_bag],
      products[:spree_tote],
      products[:spree_bag]
    ]
  },
  {  name: Faker::Company.name,
    business_type: "Manufacturer, Trading Company",
    description: Faker::Lorem.sentence,
    :products => [
      products[:ror_mug],
      products[:ror_stein],
      products[:spree_stein],
      products[:spree_mug]
    ]
  },
  {  name: Faker::Company.name,
    business_type: "Manufacturer, Trading Company",
    description: Faker::Lorem.sentence,
    :products => [
      products[:ror_jr_spaghetti],
      products[:spree_jr_spaghetti]
    ]
  },
  {  name: Faker::Company.name,
    business_type: "Manufacturer, Trading Company",
    description: Faker::Lorem.sentence,
    :products => [
      products[:ror_baseball_jersey],
      products[:ror_ringer],
      products[:apache_baseball_jersey],
      products[:ruby_baseball_jersey],
      products[:spree_baseball_jersey],
      products[:spree_ringer]
    ],
  },
  
]

companies.each do |company_attrs|
  Spree::Company.create!(company_attrs)
end