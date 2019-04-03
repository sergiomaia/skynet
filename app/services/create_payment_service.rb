class CreatePaymentService < Struct.new(:package)
  def self.create_payment(package)
    Payment.create!(
      status: 2,
      expires_at: nil,
      value: package.value,
      paid_at: nil,
      package_id: package.id
    )
  end
end


