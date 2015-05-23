class CreateDataConfigs < ActiveRecord::Migration
  def change
    create_table :data_configs do |t|

    t.integer "repository_id",                         :null => false
    t.binary  "abs_path",                :limit => 767
    t.binary  "name",                   :limit => 767
    t.integer "dataset_config_id",                     :null => false
    t.integer "goldstandard_config_id"
    t.integer "data_config_id"
  end

  add_index "data_configs", ["abs_path", "repository_id"], :name => "data_configs_abs_path_UNIQUE", :unique => true, :length => {"abs_path" => 767}
  add_index "data_configs", ["data_config_id"], :name => "fk_data_configs_1"
  add_index "data_configs", ["dataset_config_id"], :name => "fk_dataConfigs_1"
  add_index "data_configs", ["goldstandard_config_id"], :name => "fk_dataConfigs_2"
  add_index "data_configs", ["repository_id"], :name => "fk_dataConfigs_3"
  end
end
