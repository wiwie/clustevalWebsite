class CreateOptimizableProgramParameters < ActiveRecord::Migration
  def change
    create_table :optimizable_program_parameters do |t|
    t.integer "id",                   :null => false
    t.integer "repository_id",        :null => false
    t.integer "program_config_id",    :null => false
    t.integer "program_parameter_id", :null => false
  end

  add_index "optimizable_program_parameters", ["program_config_id", "program_parameter_id", "repository_id"], :name => "index5", :unique => true
  add_index "optimizable_program_parameters", ["program_config_id"], :name => "fk_optimizableProgramParameter_3"
  add_index "optimizable_program_parameters", ["program_parameter_id"], :name => "fk_optimizableProgramParameter_1"
  add_index "optimizable_program_parameters", ["repository_id"], :name => "fk_optimizableProgramParameter_2"
  end
end
