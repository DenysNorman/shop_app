class Review < ApplicationRecord
  belongs_to :product

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :author, presence: true, length: { maximum: 40 }
  validates :body, presence: true, length: { maximum: 400 }
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX }

  scope :published, -> { where(published: true) }

end
