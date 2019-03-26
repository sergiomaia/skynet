class CreateProtocols < ActiveRecord::Migration[5.2]
  def change
    create_table :protocols, id: :uuid do |t|
      t.references :user, type: :uuid
      t.references :customer, type: :uuid
      t.string :number
      t.string :call_time

      t.timestamps
    end
  end
end
