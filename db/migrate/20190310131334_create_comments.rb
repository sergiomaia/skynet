class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments, id: :uuid do |t|
      t.text :body
      t.references :user, type: :uuid
      t.references :customer, type: :uuid

      t.timestamps
    end
  end
end
