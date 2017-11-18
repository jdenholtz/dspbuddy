class AlterDatasAddDatasetIdColumn < ActiveRecord::Migration[5.0]

  def change
    add_column :data, :dataset_id, :integer
    add_index :data, :dataset_id
  end
end
