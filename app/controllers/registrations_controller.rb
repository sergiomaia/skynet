class RegistrationsController < Devise::RegistrationsController
  skip_before_action :require_no_authentication, only: [:new]

  def new
    super
  end
end