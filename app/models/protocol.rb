class Protocol < ApplicationRecord
  belongs_to :user
  belongs_to :customer

  validates :body, presence: true
end
