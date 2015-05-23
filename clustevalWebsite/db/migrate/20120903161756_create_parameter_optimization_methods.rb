class CreateParameterOptimizationMethods < ActiveRecord::Migration
  def change
    create_table :parameter_optimization_methods do |t|

    t.integer "repository_id",                :null => false
    t.binary  "name",          :limit => 767, :null => false
  end

  add_index "parameter_optimization_methods", ["name", "repository_id"], :name => "parameter_optimization_methods_name_UNIQUE", :unique => true, :length => {"name" => 767}
  add_index "parameter_optimization_methods", ["repository_id"], :name => "fk_parameterOptimizationMethods_1"
  end
end
