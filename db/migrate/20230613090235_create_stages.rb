class CreateStages < ActiveRecord::Migration[7.0]
  def change
    create_table :stages do |t|
      t.string :name

      t.references :project

      t.timestamps
    end
  end
end
