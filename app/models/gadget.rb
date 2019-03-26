class Gadget < ApplicationRecord
  belongs_to :customer, optional: true

  validates :card, :nds, :status, presence: true
  enum status: { inativo: 0, ativo: 1 }
end
