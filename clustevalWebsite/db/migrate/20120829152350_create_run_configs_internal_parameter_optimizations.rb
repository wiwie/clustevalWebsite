class CreateRunConfigsInternalParameterOptimizations < ActiveRecord::Migration
  def change
    create_table :run_internal_parameter_optimizations do |t|

    t.integer "repository_id",    :null => false
    t.integer "run_execution_id", :null => false
  end

  add_index "run_internal_parameter_optimizations", ["repository_id", "run_execution_id"], :name => "index4", :unique => true
  add_index "run_internal_parameter_optimizations", ["repository_id"], :name => "fk_runConfigsInternalParameterOptimization_1"
  add_index "run_internal_parameter_optimizations", ["run_execution_id"], :name => "fk_runConfigsInternalParameterOptimization_2"
  end
end
