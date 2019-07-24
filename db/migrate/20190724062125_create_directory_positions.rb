class CreateDirectoryPositions < ActiveRecord::Migration[5.2]
  def change
    create_table :directory_positions do |t|
      t.integer :parent_id, index: true, foreign_key_column_for: :directories
      t.integer :child_id, index: true, foreign_key_column_for: :directories
      t.integer :level, default: 0, null: false
    end

    add_index :directory_positions, [:parent_id, :child_id, :level], unique: true
  end
end
