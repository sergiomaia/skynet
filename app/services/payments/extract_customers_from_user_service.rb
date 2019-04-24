module Payments
  class ExtractCustomersFromUserService < Struct.new(:user)
    attr_accessor :user

    def extract
      user.customers.each do |customer|
        Payments::CreateAllPaymentService.create(user, customer)
      end
    end
  end
end
