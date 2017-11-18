class DatasetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @datasets = Dataset.all
  end

  def new
    @dataset = Dataset.new 
  end

  def create
    current_user.datasets.create(dataset_params)
    redirect_to root_path
  end

  def show
    @dataset = Dataset.find(params[:id])
    @datum = Datum.new
  end



  private

  def dataset_params
    params.require(:dataset).permit(:title, :description, :channels, :sps, :share)
  end

end
