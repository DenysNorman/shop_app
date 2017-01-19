FactoryGirl.define do
  factory :category do |f|
    f.sequence(:title) { |n| "Cool category #{n}" }
  end

  factory :product do |f|
    f.sequence(:title) { |n| "Cool product #{n}" }
    f.description 'Cool description'
    f.price 999
    f.photo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'brands', 'images', 'image.jpg')) }
    f.category
  end

  factory :order do |f|
    f.name 'Coolname'
    f.phone 123123
    f.status 'new'
    f.email { "#{name}@cool.com".downcase }
  end

  factory :order_product do |f|
    f.product
    f.order
    f.quantity 1
  end
end