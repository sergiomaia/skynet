class Task < ApplicationRecord
  belongs_to :user
  validates :description, presence: true

  enum status: {
    aberta: 0,
    completa: 1
  }
end
