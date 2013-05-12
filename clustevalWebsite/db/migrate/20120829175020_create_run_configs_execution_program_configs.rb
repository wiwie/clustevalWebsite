class CreateRunConfigsExecutionProgramConfigs < ActiveRecord::Migration
  def change
    create_table :run_execution_program_configs do |t|

    t.integer "repository_id",     :null => false
    t.integer "run_execution_id",  :null => false
    t.integer "program_config_id", :null => false
  end

  add_index "run_execution_program_configs", ["program_config_id"], :name => "fk_runConfigsExecutionProgramConfigs_2"
  add_index "run_execution_program_configs", ["repository_id"], :name => "fk_runConfigsExecutionProgramConfigs_3"
  add_index "run_execution_program_configs", ["run_execution_id", "program_config_id", "repository_id"], :name => "index4", :unique => true
  add_index "run_execution_program_configs", ["run_execution_id"], :name => "fk_runConfigsExecutionProgramConfigs_1"
  add_index "run_execution_program_configs", ["run_execution_id"], :name => "fk_run_execution_program_configs_1"
  end
end
