class CreateRunResultsParameterOptimizationsParameterSetParameters < ActiveRecord::Migration
  def change
    create_table :run_results_parameter_optimizations_parameter_set_parameters do |t|

    t.integer "repository_id",                                        :null => false
    t.integer "run_results_parameter_optimization_id", :null => false
    t.integer "run_results_parameter_optimizations_parameter_set_id", :null => false
    t.integer "program_parameter_id",                                 :null => false
  end

  add_index "run_results_parameter_optimizations_parameter_set_parameters", ["program_parameter_id"], :name => "fk_parameter_optimizations_parameter_set_parameters_3"
  add_index "run_results_parameter_optimizations_parameter_set_parameters", ["repository_id", "run_results_parameter_optimization_id", "run_results_parameter_optimizations_parameter_set_id", "program_parameter_id"], :name => "index5", :unique => true
  add_index "run_results_parameter_optimizations_parameter_set_parameters", ["repository_id"], :name => "fk_parameter_optimizations_parameter_set_parameters_1"
  add_index "run_results_parameter_optimizations_parameter_set_parameters", ["run_results_parameter_optimizations_parameter_set_id"], :name => "fk_parameter_optimizations_parameter_set_parameters_2"
  end
end
