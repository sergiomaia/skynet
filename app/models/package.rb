class Package < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :gadget, optional: true

  enum plan: { top_full_hd: 0 }
  enum status: { ativa: 0, inativa: 1}
end
