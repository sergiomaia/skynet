class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers, id: :uuid do |t|
      t.string :name
      t.string :email
      t.string :cpf
      t.date   :birthdate
      t.string :phone
      t.string :cellphone

      t.timestamps
    end
  end
end
