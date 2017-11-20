class DatasController < ApplicationController
   require 'descriptive_statistics/safe'


   def new
    @dataset = Dataset.find(params[:id])
    redirect_to root_path
   end

  def show
    @datum = Datum.find(params[:id])
    dataset = @datum.dataset
    #puts ""
    #puts ""
    #puts dataset.datafile.file.file.key.inspect
    #puts ""
    #puts dataset.datafile.file.url
    #file_data = open(dataset.datafile.file.url)

    #puts file_data
    #puts file_data.inspect

   

    #puts ""
    #puts dataset.datafile.file.path
    #puts dataset.datafile.storage.inspect
    #puts dataset.datafile.inspect
    #puts dataset.datafile.inspect
    #puts ""
    #puts dataset.datafile.file.path.inspect
    #puts ""

    #myTestData = File.read(file_data).split(/[\r\n]+/)
    #mydata = File.read(@datum.dataset.datafile.file.file).split(/[\r\n]+/)
    #myTestData = File.read("@datum.dataset.datafile").split(/[\r\n]+/)
    #puts myTestData.inspect
    puts ""
    t1 = Time.now

    #mydata = File.read("./app/assets/images/testdata3.data").split(/[\r\n]+/)
    mydata = File.read(open(@datum.dataset.datafile.file.url)).split(/[\r\n]+/)
    t2 = Time.now
    deltaT =  (t2 - t1) * 10 * 10 * 10
    puts deltaT
    puts ""
    
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
