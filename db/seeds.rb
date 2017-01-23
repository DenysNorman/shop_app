# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

20.times do
  title = Faker::Name.first_name
  Feature.create(title: title)
end

10.times do
  title = Faker::Name.first_name
  category = Category.create(title: title)

  5.times do
    product_name = Faker::Book.genre
    description = Faker::Lorem.paragraph
    price = Faker::Commerce.price
    photo = File.open(Dir.glob(File.join(Rails.root, 'app','assets','images', '*')).sample)
    product = Product.create(title: product_name, description: description,
                             photo: photo, price: price, category_id: category.id, in_stock: true)
    5.times do
    feature_value = Faker::Color.color_name
    FeatureValue.create(feature_id: Feature.order('RANDOM()').first.id, product_id: product.id, title: feature_value)
    end
    reviews = rand(1..20)
    reviews.times do
      email = Faker::Internet.email
      author = Faker::Name.first_name
      body = Faker::Lorem.paragraph
      rating = rand(1..5)
      published = true
      Review.create(author: author, product_id: product.id, body: body, rating: rating, email: email, published: published)
    end
    association = rand(1..10)
    association.times do
      RelatedProduct.create(product_id: product.id, associated_id: Product.order('RANDOM()').first.id)
    end
  end
end
