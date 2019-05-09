class Payment < ApplicationRecord
  belongs_to :package
  belongs_to :user

  enum status: {
    atrasado: 0,
    emdia: 1,
    pendente: 2
  }

  def current_month
    Date.current.month
  end

  def expires_today
    unless self.expires_at.nil?
      self.expires_at == Date.current
    end
  end

  def late
    unless self.expires_at.nil?
      self.expires_at > Date.current
    end
  end
end
