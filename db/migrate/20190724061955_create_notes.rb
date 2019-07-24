class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string  :name
      t.text    :note_text
    end

    add_reference :notes, :directories, foreign_key: true, index: true, null: true
  end
end
