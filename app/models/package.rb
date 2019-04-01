class Package < ApplicationRecord
  belongs_to :customer, optional: true
  has_many :payments

  enum plan: { top_full_hd: 0 }

  enum status: {
    ativo: 0,
    inativo: 1
  }
end
