class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.float :budget
      t.datetime :start_time
      t.datetime :end_time

      t.references :tag
      t.references :user

      t.timestamps
    end
  end
end
