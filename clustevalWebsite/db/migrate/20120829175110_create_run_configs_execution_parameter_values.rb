class CreateRunConfigsExecutionParameterValues < ActiveRecord::Migration
  def change
    create_table :run_execution_parameter_values do |t|

    t.integer "repository_id",                       :null => false
    t.integer "run_execution_id",                    :null => false
    t.integer "program_config_id",                   :null => false
    t.integer "program_parameter_id",                :null => false
    t.binary  "value",                :limit => 200
  end

  add_index "run_execution_parameter_values", ["program_config_id"], :name => "fk_runConfigsExecutionParameterValues_2"
  add_index "run_execution_parameter_values", ["program_parameter_id"], :name => "fk_runConfigsExecutionParameterValues_3"
  add_index "run_execution_parameter_values", ["repository_id", "run_execution_id", "program_config_id", "program_parameter_id"], :name => "index6", :unique => true
  add_index "run_execution_parameter_values", ["repository_id"], :name => "fk_runConfigsExecutionParameterValues_1"
  add_index "run_execution_parameter_values", ["run_execution_id"], :name => "fk_runConfigsExecutionParameterValues_4"
  end
end
