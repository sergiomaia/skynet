class WelcomeController < ApplicationController
  def index
    @late_customers = Customer.includes(:packages).where('packages.expires_at < ?', Date.current).references(:packages)
    @late_today_customers = Customer.includes(:packages).where('packages.expires_at = ?', Date.current).references(:packages)
  end
end
