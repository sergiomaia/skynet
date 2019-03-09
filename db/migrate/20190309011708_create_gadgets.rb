class CreateGadgets < ActiveRecord::Migration[5.2]
  def change
    create_table :gadgets, id: :uuid do |t|
      t.string  :card
      t.string  :nds
      t.string  :model
      t.integer :status

      t.timestamps
    end
  end
end
