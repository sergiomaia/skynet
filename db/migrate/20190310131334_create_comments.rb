class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments, id: :uuid do |t|
      t.text :body
      t.integer :user_id
      t.integer :customer_id

      t.timestamps
    end
  end
end
