class Message < ApplicationRecord
  belongs_to :book
  validates :message, presence: true, length: { minimum: 5, maximum: 300 }
end
