class Product < ApplicationRecord
  belongs_to :category
  has_many :feature_values, dependent: :destroy
  has_many :features, through: :feature_values
  has_many :reviews, dependent: :destroy
  has_many :related_products
  has_many :related_products_associated, class_name: 'RelatedProduct', foreign_key: 'associated_id'
  has_many :order_products


  validates :title, presence: true, uniqueness: true
  validates :price, presence: true
  validates :photo, presence: true


  mount_uploader :photo, ProductPhotoUploader
end
