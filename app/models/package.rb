class Package < ApplicationRecord
  belongs_to :customer
  belongs_to :gadget

  enum plan: { top_full_hd: 0 }
end
