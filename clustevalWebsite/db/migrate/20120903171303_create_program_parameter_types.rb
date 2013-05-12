class CreateProgramParameterTypes < ActiveRecord::Migration
  def change
    create_table :program_parameter_types do |t|

    t.binary "name", :limit => 200, :null => false
  end

  add_index "program_parameter_types", ["name"], :name => "index3", :unique => true, :length => {"name" => 200}
  end
end
