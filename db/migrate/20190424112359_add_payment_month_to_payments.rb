class AddPaymentMonthToPayments < ActiveRecord::Migration[5.2]
  def change
    add_column :payments, :payment_month, :integer
  end
end
