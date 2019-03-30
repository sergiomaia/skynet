class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks, id: :uuid do |t|
      t.string :description
      t.integer :status, default: 0
      t.references :user, type: :uuid

      t.timestamps
    end
  end
end
