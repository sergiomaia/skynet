class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages, id: :uuid do |t|
      t.references :customer, type: :uuid
      t.references :gadget, type: :uuid
      t.integer :plan
      t.float :value
      t.date :expires_at
      t.integer :status
      t.string :protocol

      t.timestamps
    end
  end
end
