class CreateRunConfigsExecutionDataConfigs < ActiveRecord::Migration
  def change
    create_table :run_execution_data_configs do |t|

    t.integer "repository_id",    :null => false
    t.integer "run_execution_id", :null => false
    t.integer "data_config_id",   :null => false
  end

  add_index "run_execution_data_configs", ["data_config_id"], :name => "fk_runConfigsExecutionDataConfigs_2"
  add_index "run_execution_data_configs", ["repository_id"], :name => "fk_runConfigsExecutionDataConfigs_3"
  add_index "run_execution_data_configs", ["run_execution_id", "data_config_id", "repository_id"], :name => "index4", :unique => true
  add_index "run_execution_data_configs", ["run_execution_id"], :name => "fk_runConfigsExecutionDataConfigs_1"
  add_index "run_execution_data_configs", ["run_execution_id"], :name => "fk_run_execution_data_configs_1"
  end
end
