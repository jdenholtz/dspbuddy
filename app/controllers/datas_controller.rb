class DatasController < ApplicationController
   require 'descriptive_statistics/safe'


   def new
    @dataset = Dataset.find(params[:id])
    redirect_to root_path
   end

  def show
    @datum = Datum.find(params[:id])
    dataset = @datum.dataset
    
    mydata = File.read(open(@datum.dataset.datafile.file.url)).split(/[\r\n]+/)
    
    mydata.length.times do |index|
      mydata[index] = mydata[index].split(/\t/).map(&:to_f)
    end
    
    @mysps = @datum.dataset.sps
    channelToPlot = @datum.channel
    @plotData = []
    mydata.length.times do |index|
      @plotData[index] = mydata[index][channelToPlot -1]
    end
  end

  def create
    @dataset = Dataset.find(params[:dataset_id])
    @dataset.datum.create(datum_params)
    redirect_to dataset_path(@dataset.id)
  end



  private

  def datum_params
    params.require(:datum).permit(:name, :channel, :sps)
  end

end
