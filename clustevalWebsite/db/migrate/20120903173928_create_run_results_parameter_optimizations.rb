class CreateRunResultsParameterOptimizations < ActiveRecord::Migration
  def change
    create_table :run_results_parameter_optimizations do |t|

    t.integer "repository_id",                           :null => false
    t.integer "run_results_execution_id",                :null => false
    t.integer "data_config_id",                          :null => false
    t.integer "program_config_id",                       :null => false
    t.binary  "abs_path",                  :limit => 767
  end

  add_index "run_results_parameter_optimizations", ["data_config_id"], :name => "fk_run_results_parameter_optimizations_1"
  add_index "run_results_parameter_optimizations", ["program_config_id"], :name => "fk_run_results_parameter_optimizations_2"
  add_index "run_results_parameter_optimizations", ["repository_id", "run_results_execution_id", "abs_path"], :name => "run_results_parameter_optimizations_index4", :unique => true, :length => {"abs_path" => 767}
  add_index "run_results_parameter_optimizations", ["repository_id"], :name => "fk_runResultParameterOptimization_1"
  add_index "run_results_parameter_optimizations", ["run_results_execution_id"], :name => "fk_runResultParameterOptimization_2"
  add_index "run_results_parameter_optimizations", ["run_results_execution_id"], :name => "fk_run_results_parameter_optimization_1"
  add_index "run_results_parameter_optimizations", ["abs_path"], :name => "index_paramopt_abspath", :length => {"abs_path" => 767}
  end
end
