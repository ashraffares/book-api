class Message < ApplicationRecord
  belongs_to :book
  validate :message, presence: true, length: { minimum: 5, maximum: 300 }
end
