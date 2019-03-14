class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers, id: :uuid, type: :uuid do |t|
      t.string :name
      t.string :email
      t.string :cpf
      t.date   :birthdate
      t.string :phone
      t.string :cellphone

      t.timestamps
    end
    add_index :customers, :id, unique: true
  end
end
