class CreateDatasets < ActiveRecord::Migration[5.0]
  def change
    create_table :datasets do |t|
      t.string :title
      t.string :description
      t.integer :channels
      t.integer :sps
      t.boolean :share
      t.timestamps
      
    end
  end
end
