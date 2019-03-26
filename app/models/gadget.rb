class Gadget < ApplicationRecord
  belongs_to :customer, optional: true

  validates :card, :nds, :status, presence: true
  
  enum status: {
    inactive: 0,
    active: 1
  }
end
