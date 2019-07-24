class CreateDirectories < ActiveRecord::Migration[5.2]
  def change
    create_table :directories do |t|
      t.string  :name
    end

    add_reference :directories, :parent, index: true, null: true
  end
end
