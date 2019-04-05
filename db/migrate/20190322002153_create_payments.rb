class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments, id: :uuid do |t|
      t.boolean :paid, default: false
      t.float :value
      t.date :paid_at
      t.date :expires_at
      t.references :package, type: :uuid
      t.references :user, type: :uuid

      t.timestamps
    end
  end
end
