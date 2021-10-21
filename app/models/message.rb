class Message < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :message, presence: true, length: { minimum: 5, maximum: 300 }
end
