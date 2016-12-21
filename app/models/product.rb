class Product < ApplicationRecord
  belongs_to :category
  has_many :feature_values, dependent: :destroy
  has_many :features, through: :feature_values
  has_many :reviews, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :price, presence: true
  validates :photo, presence: true


  mount_uploader :photo, ProductPhotoUploader
end
