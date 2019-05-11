class LateTodayCustomersQuery
  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def self.late_today(user)
    user.customers.includes(
      :packages).where(
        'packages.expires_at_day = ?', Date.current.day
      ).references(:packages)
  end
end
