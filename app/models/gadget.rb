class Gadget < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :user

  validates :card, :nds, :status, presence: true

  enum status: {
    inativo: 0,
    ativo: 1
  }
end
