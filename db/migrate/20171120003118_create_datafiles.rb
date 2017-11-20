class CreateDatafiles < ActiveRecord::Migration[5.0]
  def change
    create_table :datafiles do |t|
      t.integer  :dataset_id
      t.string :datafile
      t.timestamps
    end
  end
end
