class DirectoriesController < ApplicationController
  # for brevities sake, just throwing it all in a single controller/view


  def index
    @current_directory = Directory.find_by(id: index_params[:current_id])

    parent_id = @current_directory.present? ? @current_directory.id : index_params[:parent_id]

    @directories = Directory.where(parent_id: parent_id)
    @directories.where(parent_id: parent_id).where("name ILIKE ?", "%#{index_params[:search_term]}%") if index_params[:search_term]

    @directory = Directory.new(parent_id: parent_id)

    @note = Note.new(directories_id: parent_id)
    @notes = Note.where(directories_id: parent_id)
  end

  def create
    directory = Directory.create(directory_params)
    redirect_to action: :index, current_id: directory.parent_id
    # redirect_to :back
  end

  private
    def directory_params
      params.require(:directory).permit(:name, :parent_id, :child_id)
    end

    def index_params
      params.permit(:parent_id, :child_id, :current_id, :search_term)
    end
end