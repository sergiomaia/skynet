class WelcomeController < ApplicationController
  def index
    @late_customers = current_user.customers.includes(:packages).where('packages.expires_at_day < ?', Date.current.month).references(:packages)
    @late_today_customers = current_user.customers.includes(:packages).where('packages.expires_at_day = ?', Date.current.day).references(:packages)
  end
end
