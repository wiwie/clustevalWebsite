class CreateDatasetConfigs < ActiveRecord::Migration
  def change
    create_table :dataset_configs do |t|

    t.integer "repository_id",                      :null => false
    t.binary  "abs_path",             :limit => 767
    t.binary  "name",                :limit => 767
    t.integer "dataset_id",                         :null => false
    t.integer "dataset_config_id"
  end

  add_index "dataset_configs", ["abs_path", "repository_id"], :name => "dataset_configs_abs_path_UNIQUE", :unique => true, :length => {"abs_path" => 767}
  add_index "dataset_configs", ["dataset_config_id"], :name => "fk_dataset_configs_1"
  add_index "dataset_configs", ["dataset_id"], :name => "fk_dataSetConfigs_2"
  add_index "dataset_configs", ["repository_id"], :name => "fk_dataSetConfigs_1"
  end
end
