class FeatureValue < ApplicationRecord
  belongs_to :feature
  belongs_to :product

  validates :title, presence: true
end
