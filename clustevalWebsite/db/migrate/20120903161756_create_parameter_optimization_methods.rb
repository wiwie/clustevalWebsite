class CreateParameterOptimizationMethods < ActiveRecord::Migration
  def change
    create_table :parameter_optimization_methods do |t|

    t.integer "repository_id",                :null => false
    t.binary  "name",          :limit => 200, :null => false
  end

  add_index "parameter_optimization_methods", ["name", "repository_id"], :name => "name_UNIQUE", :unique => true, :length => {"name" => 200}
  add_index "parameter_optimization_methods", ["repository_id"], :name => "fk_parameterOptimizationMethods_1"
  end
end
