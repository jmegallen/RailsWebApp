class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :body, presence: true
    validates :user, presence: true
    validates :product, presence: true
    validates :rating, numericality: { only_integer: true }

  delegate :first_name, to: :user, allow_nil: true, prefix: true

  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_aesc, -> { order(rating: :aesc) }
end