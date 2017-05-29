class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  delegate :first_name, to: :user, allow_nil: true, prefix: true

  scope :rating_desc, -> { order(rating: :desc) }
end