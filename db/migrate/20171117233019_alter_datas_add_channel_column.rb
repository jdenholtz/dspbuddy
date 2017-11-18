class AlterDatasAddChannelColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :data, :channel, :integer
  end
end
