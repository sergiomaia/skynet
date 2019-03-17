class WelcomeController < ApplicationController
  def index
    @last_registered_customers = Customer.limit(10).order('created_at desc')
    @late_customers = Customer.includes(:packages).where('packages.expires_at < ?', Date.current).references(:packages)
    @late_today_customers = Customer.includes(:packages).where('packages.expires_at = ?', Date.current).references(:packages)
  end
end
