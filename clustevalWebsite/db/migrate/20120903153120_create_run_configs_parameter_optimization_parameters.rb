class CreateRunConfigsParameterOptimizationParameters < ActiveRecord::Migration
  def change
    create_table :run_parameter_optimization_parameters do |t|

    t.integer "repository_id",                 :null => false
    t.integer "run_parameter_optimization_id", :null => false
    t.integer "program_config_id",             :null => false
    t.integer "program_parameter_id",          :null => false
  end

  add_index "run_parameter_optimization_parameters", ["program_config_id"], :name => "fk_runConfigsParameterOptimizationParameters_1"
  add_index "run_parameter_optimization_parameters", ["program_parameter_id"], :name => "fk_runConfigParameterOptimizationParameters_3"
  add_index "run_parameter_optimization_parameters", ["repository_id", "run_parameter_optimization_id", "program_config_id", "program_parameter_id"], :name => "index6", :unique => true
  add_index "run_parameter_optimization_parameters", ["repository_id"], :name => "fk_runConfigParameterOptimizationParameters_1"
  add_index "run_parameter_optimization_parameters", ["run_parameter_optimization_id"], :name => "fk_runConfigParameterOptimizationParameters_2"
  end
end
