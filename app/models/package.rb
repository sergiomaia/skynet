class Package < ApplicationRecord
  belongs_to :customer, optional: true

  enum plan: { top_full_hd: 0 }

  enum status: {
    ativo: 0,
    inativo: 1
  }
end
