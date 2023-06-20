class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.datetime :deadline

      t.references :tag
      t.references :project
      t.references :stage
      t.references :user

      t.timestamps
    end
  end
end
