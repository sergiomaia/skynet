module Payments
  class CreateAllPaymentsService < Struct.new(:customer, :user)
    attr_accessor :customer, :user

    def self.run
      customer.packages.each do |package|
        new(package).execute
      end
    end

    private

    def execute
      Payment.create!(
        paid: false,
        expires_at_day: package.payments.last.expires_at_day,
        value: package.value,
        paid_at: nil,
        package_id: package.id,
        user_id: user.id
      )

      update_payment_month
    end

    def update_payment_month
      Payment.update(payment_month: Date.current.month)
    end
  end
end
