class WelcomeController < ApplicationController
  def index
    @late_customers = current_user.customers.includes(:packages).where('packages.expires_at < ?', Date.current).references(:packages)
    @late_today_customers = current_user.customers.includes(:packages).where('packages.expires_at = ?', Date.current).references(:packages)
  end
end
