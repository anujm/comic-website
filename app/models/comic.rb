class Comic < ActiveRecord::Base
  def as_json(options)
    super(:only => [:id, :name, :url])
  end
end