class ComicsController < ApplicationController
  respond_to :json, :html

  def index
    comic = Comic.new
    comic = Comic.last if Comic.count > 0
    respond_with comic
  end

  def show
    comic = Comic.find_by_id(params[:id]) || Comic.last
    respond_with comic
  end

  def create
    comic = Comic.create(comic_params)
    respond_with comic
  end

  def random
    random_id = rand(Comic.count) + 1
    comic = Comic.find_by_id(random_id) || Comic.last
    respond_with comic
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def comic_params
    params.require(:comic).permit(:name, :url)
  end
end