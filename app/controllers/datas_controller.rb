class DatasController < ApplicationController
   require 'descriptive_statistics/safe'

  def show
    mydata = File.read("./app/assets/images/testdata2.txt").split(/[\r\n]+/)#.map(&:to_f)
    #@mydata = File.read("./app/assets/images/testdata2.txt")gsub(/\s+/m, ' ').strip.split(" ")
    mydata.length.times do |index|
      mydata[index] = mydata[index].split(/\t/).map(&:to_f)
    end
    
    @mysps = 960
    channelToPlot = 1
    @plotData = []
    squares = []

    mydata.length.times do |index|
      @plotData[index] = mydata[index][channelToPlot -1]
    end
  end

end
