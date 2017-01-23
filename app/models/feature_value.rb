class FeatureValue < ApplicationRecord
  belongs_to :feature
  belongs_to :product

  validates :title, presence: true, length: { maximum: 40 }
  validates :product_id, presence: true
  validates :feature_id, presence: true
end
