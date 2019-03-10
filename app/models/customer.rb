class Customer < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  belongs_to :user
  has_many :packages
  has_many :comments
  has_many :gadgets, through: :packages
end
