class Review < ApplicationRecord
  belongs_to :product

  validates :author, presence: true
  validates :body, presence: true
  validates :email, presence: true

  scope :published, -> { where(published: true) }

end
