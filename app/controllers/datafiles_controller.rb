class DatafilesController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    
  end

  private

  def datafile_params
    params.require(:datafile).permit(:datafile)
  end

end
