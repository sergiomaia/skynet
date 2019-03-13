class Customer < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates_associated :packages

  belongs_to :user
  has_many :packages, dependent: :destroy
  has_many :comments
  has_many :gadgets, through: :packages

  accepts_nested_attributes_for :packages, allow_destroy: true
end
