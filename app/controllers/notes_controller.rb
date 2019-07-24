class NotesController < ApplicationController

  def create
    note = Note.create(note_params)
    redirect_to controller: 'directories', action: :index, current_id: note.directory_id
  end

  private
    def note_params
      params.require(:note).permit(:name, :directory_id, :note_text)
    end
end