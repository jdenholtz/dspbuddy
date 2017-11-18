class DatasController < ApplicationController
   require 'descriptive_statistics/safe'


   def new
    @dataset = Dataset.find(params[:id])
    redirect_to root_path
   end

  def show
    @datum = Datum.find(params[:id])
    puts ""
    puts @datum.channel.inspect

    mydata = File.read("./app/assets/images/testdata2.txt").split(/[\r\n]+/)#.map(&:to_f)
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
