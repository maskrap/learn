class CreateSection < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.string :name
      t.integer :chapter_id
      t.integer :lesson_id
      t.timestamps
    end
  end
end
