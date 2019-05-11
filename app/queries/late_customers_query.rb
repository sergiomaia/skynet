class LateCustomersQuery
  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def self.late_users(user)
    user.customers.includes(
      :packages).where(
        'packages.expires_at_day < ?', Date.current.month
      ).references(:packages)
  end
end
