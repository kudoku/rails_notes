class NotesController < ApplicationController

  def create
    note = Note.create(note_params)
    binding.pry
    redirect_to controller: 'directories', action: :index, current_id: note.directories_id
  end

  private
    def note_params
      params.require(:note).permit(:name, :directories_id, :note_text)
    end
end