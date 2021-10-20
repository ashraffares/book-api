class Book < ApplicationRecord
  belongs_to :user
  has_many :messages
  validates :title, :author, :pagesTotal, :category, :user_id, presence: true
end
