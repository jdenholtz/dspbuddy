class AddDatafileToDatasets < ActiveRecord::Migration[5.0]
  def change
    add_column :datasets, :datafile, :string
  end
end
