class CreateDirectoriesPositions < ActiveRecord::Migration[5.2]
  def change
    create_table :directories_positions do |t|
      t.integer :directory_id, index: true, foreign_key_column_for: :directories
      t.integer :child_id, index: true, foreign_key_column_for: :directories
      t.integer :level, default: 0, null: false
    end
  end
end
