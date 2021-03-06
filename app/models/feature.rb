class Feature < ApplicationRecord
  has_many :feature_values, dependent: :destroy
  has_many :products, through: :feature_values

  validates :title, presence: true, length: { maximum: 40 },
            uniqueness: true
end
