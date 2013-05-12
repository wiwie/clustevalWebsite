class CreateDataConfigs < ActiveRecord::Migration
  def change
    create_table :data_configs do |t|

    t.integer "repository_id",                         :null => false
    t.binary  "absPath",                :limit => 200
    t.binary  "name",                   :limit => 200
    t.integer "dataset_config_id",                     :null => false
    t.integer "goldstandard_config_id"
    t.integer "data_config_id"
  end

  add_index "data_configs", ["absPath", "repository_id"], :name => "absPath_UNIQUE", :unique => true, :length => {"absPath" => 200}
  add_index "data_configs", ["data_config_id"], :name => "fk_data_configs_1"
  add_index "data_configs", ["dataset_config_id"], :name => "fk_dataConfigs_1"
  add_index "data_configs", ["goldstandard_config_id"], :name => "fk_dataConfigs_2"
  add_index "data_configs", ["repository_id"], :name => "fk_dataConfigs_3"
  end
end
