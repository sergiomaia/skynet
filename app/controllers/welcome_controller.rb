class WelcomeController < ApplicationController
  def index
    @last_registered_customers = Customer.limit(15).order('created_at desc')
    @late_customers = Customer.includes(:packages).where('packages.expires_at < ?', Date.current).references(:packages)
    @late_today_customers = Customer.includes(:packages).where('packages.expires_at = ?', Date.current).references(:packages)
    @birthday_today_customers = Customer.where(birthdate: Date.current.beginning_of_month..Date.current.end_of_month)
  end
end
