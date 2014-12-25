class ComicsController < ApplicationController

  def index
    @comic = Comic.new
    @comic = Comic.last if Comic.count > 0 else
  end

  def show
    @comic = Comic.find_by_id(params[:id]) || Comic.last
  end

  def create
    Comic.create(comic_params)
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def comic_params
    params.require(:comic).permit(:name, :url)
  end
end