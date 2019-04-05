class CreatePaymentService < Struct.new(:package, :current_user)
  def self.create_payment(package, current_user)
    Payment.create!(
      paid: false,
      expires_at: nil,
      value: package.value,
      paid_at: nil,
      package_id: package.id,
      user_id: current_user.id
    )
  end
end


