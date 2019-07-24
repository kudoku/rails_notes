class DirectoriesController < ApplicationController
  # for brevities sake, just throwing it all in a single controller/view


  def index
    @directories = Directory.all
    @directory = Directory.new
  end

  def create
    @directory = Directory.new(directory_params)
  end

  private
    def directory_params
      params.require(:directory).permit(:name)
    end
end