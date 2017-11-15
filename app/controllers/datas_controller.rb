class DatasController < ApplicationController
   require 'descriptive_statistics/safe'

  def show
    @mydata = File.read("./app/assets/images/testdata.txt").split(/[\r\n]+/).map(&:to_f)
    @mysps = 500
    puts @mysps.inspect
    @mydata.extend(DescriptiveStatistics)
    mean = @mydata.mean
    @mydata = @mydata.map {|x| x - mean}    
  end

end
