class Gadget < ApplicationRecord
  has_many :packages

  validates :card, :nds, :status, presence: true
  enum status: { inativo: 0, ativo: 1 }
end
