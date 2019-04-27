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
        expires_at: package.expires_at,
        expires_at_day: package.expires_at.day,
        value: package.value,
        paid_at: nil,
        package_id: package.id,
        user_id: user.id
      )
    end
  end
end
