class ImportsController < ApplicationController

  def index
    @imports = Import.all
  end
  
  def show
    @export = Import.all.to_json
    render json: @export
  end

end
