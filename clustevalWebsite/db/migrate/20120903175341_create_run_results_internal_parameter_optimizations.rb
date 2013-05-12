class CreateRunResultsInternalParameterOptimizations < ActiveRecord::Migration
  def change
    create_table :run_results_internal_parameter_optimizations do |t|

    t.integer "repository_id",                           :null => false
    t.integer "run_results_execution_id",                :null => false
    end
  add_index "run_results_internal_parameter_optimizations", ["repository_id", "run_results_execution_id"], :name => "index4", :unique => true
  add_index "run_results_internal_parameter_optimizations", ["repository_id"], :name => "fk_runResultParameterOptimization_1"
  end
end
