class DatumController < ApplicationController

  def show
    
    @mydata = File.read("./app/assets/images/testdata.txt").split(/[\r\n]+/).map(&:to_f)
    #@mydata = [1, 2, 3, 4, 3, 2, 1]
    #puts ""
    #puts "This Is My Data"
    #puts ""
    #puts @mydata.inspect
    #puts ""
    #puts "Data Complete"
    #puts ""
  end

end
