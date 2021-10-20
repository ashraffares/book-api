class Book < ApplicationRecord
  belongs_to :user
  validate :title, :author, :pagesTotal, :category, presence: true
end
