class CreateDatasetConfigs < ActiveRecord::Migration
  def change
    create_table :dataset_configs do |t|

    t.integer "repository_id",                      :null => false
    t.binary  "absPath",             :limit => 200
    t.binary  "name",                :limit => 200
    t.integer "dataset_id",                         :null => false
    t.integer "dataset_config_id"
  end

  add_index "dataset_configs", ["absPath", "repository_id"], :name => "absPath_UNIQUE", :unique => true, :length => {"absPath" => 200}
  add_index "dataset_configs", ["dataset_config_id"], :name => "fk_dataset_configs_1"
  add_index "dataset_configs", ["dataset_id"], :name => "fk_dataSetConfigs_2"
  add_index "dataset_configs", ["repository_id"], :name => "fk_dataSetConfigs_1"
  end
end
