class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.integer :type_tag, default: 0

      t.timestamps
    end
  end
end
