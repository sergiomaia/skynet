class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :set_user_as_admin, on: :create

  has_many :customers, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :packages, through: :customers
  has_many :gadgets, through: :customers
  has_many :tasks, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :gadgets, dependent: :destroy

  private

  def set_user_as_admin
    if User.count == 1
      self.update(admin: true)
    end
  end
end
