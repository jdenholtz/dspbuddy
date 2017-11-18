class AlterDatasAddSpsColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :data, :sps, :integer
  end
end
