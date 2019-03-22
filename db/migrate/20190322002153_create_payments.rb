class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments, id: :uuid do |t|
      t.boolean :paid
      t.date :paid_at
      t.references :customer, type: :uuid

      t.timestamps
    end
  end
end
