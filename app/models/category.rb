class Category < ApplicationRecord
  validates :title, presence: true, length: { maximum: 40 },
            uniqueness: true

  has_many :products, dependent: :destroy
  has_ancestry
end
