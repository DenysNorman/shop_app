class RelatedProduct < ApplicationRecord
  belongs_to :product
  belongs_to :associated, class_name: 'Product', foreign_key: 'associated_id'
end
