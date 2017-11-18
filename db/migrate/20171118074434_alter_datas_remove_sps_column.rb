class AlterDatasRemoveSpsColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :data, :sps, :integer
  end
end
