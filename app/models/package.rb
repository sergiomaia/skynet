class Package < ApplicationRecord
  belongs_to :customer
  belongs_to :gadget
end
