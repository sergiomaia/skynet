class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks, id: :uuid do |t|
      t.string :description
      t.boolean :completed, default: false
      t.references :user, type: :uuid

      t.timestamps
    end
  end
end
