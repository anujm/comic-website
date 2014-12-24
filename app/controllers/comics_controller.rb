class ComicsController < ApplicationController
  def index
    @comic = Comic.first
  end

  def show
    @comic = Comic.find_by_id(params[:id]) || Comic.last
  end
end