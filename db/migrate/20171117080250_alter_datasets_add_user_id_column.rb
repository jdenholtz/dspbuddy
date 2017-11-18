class AlterDatasetsAddUserIdColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :datasets, :user_id, :integer
    add_index :datasets, :user_id

  end
end
