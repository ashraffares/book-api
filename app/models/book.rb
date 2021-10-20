class Book < ApplicationRecord
  belongs_to :user
  has_many :messages
  validates :title, :author, :pagesTotal, :category, :user_id, presence: true
  validates :pagesTotal, length: { maximum: 10_000, minimum: 2 }, numericality: { only_integer: true }
end
