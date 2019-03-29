class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :customers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :packages, through: :customers
  has_many :gadgets, through: :customers
  has_many :tasks, dependent: :destroy
end
