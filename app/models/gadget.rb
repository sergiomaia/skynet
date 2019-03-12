class Gadget < ApplicationRecord
  has_many :packages

  enum status: { ativo: 0, inativo: 1 }
end
