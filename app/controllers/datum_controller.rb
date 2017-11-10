class DatumController < ApplicationController
  require 'descriptive_statistics/safe'

  def show
    @mydata = File.read("./app/assets/images/testdata.txt").split(/[\r\n]+/).map(&:to_f)
    #@mydata.extend(DescriptiveStatistics)
    #mean = @mydata.mean
    #@mydata = @mydata.map {|x| x - mean}    
  end

end
