class WelcomeController < ApplicationController
  def index
    @late_customers = LateCustomersQuery.late_users(current_user)
    @late_today_customers = LateTodayCustomersQuery.late_today(current_user)
  end
end
