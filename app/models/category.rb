class Category < ApplicationRecord
  validates :title, presence: true, length: { maximum: 40 },
            uniqueness: true
  has_ancestry orphan_strategy: :rootify
  has_many :products, dependent: :destroy

end
