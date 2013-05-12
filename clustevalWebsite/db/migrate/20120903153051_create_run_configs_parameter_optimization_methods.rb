class CreateRunConfigsParameterOptimizationMethods < ActiveRecord::Migration
  def change
    create_table :run_parameter_optimization_methods do |t|

    t.integer "repository_id",                    :null => false
    t.integer "run_parameter_optimization_id",    :null => false
    t.integer "program_config_id",                :null => false
    t.integer "parameter_optimization_method_id", :null => false
    t.integer "clustering_quality_measure_id",    :null => false
  end

  add_index "run_parameter_optimization_methods", ["clustering_quality_measure_id"], :name => "fk_runConfigsParameterOptimizationMethods_3"
  add_index "run_parameter_optimization_methods", ["parameter_optimization_method_id"], :name => "fk_runConfigsParameterOptimizationMethods_1"
  add_index "run_parameter_optimization_methods", ["program_config_id"], :name => "fk_runConfigsParameterOptimizationMethods_5"
  add_index "run_parameter_optimization_methods", ["repository_id", "run_parameter_optimization_id", "program_config_id", "parameter_optimization_method_id", "clustering_quality_measure_id"], :name => "index7", :unique => true
  add_index "run_parameter_optimization_methods", ["repository_id"], :name => "fk_runConfigsParameterOptimizationMethods_4"
  add_index "run_parameter_optimization_methods", ["run_parameter_optimization_id"], :name => "fk_runConfigsParameterOptimizationMethods_2"
  end
end
