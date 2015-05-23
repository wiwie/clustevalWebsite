class CreateProgramParameterTypes < ActiveRecord::Migration
  def change
    create_table :program_parameter_types do |t|

    t.binary "name", :limit => 767, :null => false
  end

  add_index "program_parameter_types", ["name"], :name => "program_parameter_types_index3", :unique => true, :length => {"name" => 767}
  end
end
