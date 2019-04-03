class Payment < ApplicationRecord
  belongs_to :package

  enum status: {
    atrasado: 0,
    emdia: 1,
    pendente: 2
  }

end
