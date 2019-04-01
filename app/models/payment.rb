class Payment < ApplicationRecord
  belongs_to :customer
  belongs_to :package
end
