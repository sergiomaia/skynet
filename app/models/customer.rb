class Customer < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: VALID_EMAIL_REGEX }
  validates_associated :packages

  belongs_to :user
  has_many :protocols, dependent: :destroy
  has_many :packages, dependent: :destroy
  has_many :payments, through: :packages
  has_many :comments, dependent: :destroy
  has_many :gadgets

  #TODO: in the future, refactor it using form object
  accepts_nested_attributes_for :packages, allow_destroy: true

  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def initials_letter
    full_name.scan(/(\A\w|(?<=\s)\w)/).flatten.join.upcase
  end
end
