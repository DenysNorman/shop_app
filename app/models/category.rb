class Category < ApplicationRecord
  validates :title, presence: true

  has_many :products
  has_ancestry
end
