class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments, id: :uuid do |t|
      t.integer :status
      t.date :expires_at
      t.float :value
      t.date :paid_at
      t.references :package, type: :uuid

      t.timestamps
    end
  end
end
