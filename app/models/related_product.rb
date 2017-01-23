class RelatedProduct < ApplicationRecord
  belongs_to :product
  belongs_to :associated, class_name: 'Product', foreign_key: 'associated_id'
  validates :product_id, presence: true
  validates :associated_id, presence: true
end
