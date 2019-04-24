module Payments
  class CreatePaymentService < Struct.new(:package, :current_user)
    def self.create_payment(package, current_user)
      Payment.create!(
        paid: false,
        expires_at_day: package.expires_at_day,
        value: package.value,
        paid_at: nil,
        package_id: package.id,
        user_id: current_user.id
      )
    end
  end
end
