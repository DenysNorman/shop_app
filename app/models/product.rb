class Product < ApplicationRecord
  belongs_to :category
  has_many :feature_values, dependent: :destroy
  accepts_nested_attributes_for :feature_values, allow_destroy: true
  has_many :features, through: :feature_values
  has_many :reviews, dependent: :destroy
  has_many :related_products
  accepts_nested_attributes_for :related_products, allow_destroy: true
  has_many :related_products_associated, class_name: 'RelatedProduct', foreign_key: 'associated_id'
  has_many :order_products


  validates :title, presence: true, uniqueness: true, length: { maximum: 80 }
  validates :price, presence: true
  validates :photo, presence: true

  scope :by_created, -> { order("created_at DESC") }

  mount_uploader :photo, ProductPhotoUploader
end
