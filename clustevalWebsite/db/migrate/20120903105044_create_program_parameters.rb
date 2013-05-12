class CreateProgramParameters < ActiveRecord::Migration
  def change
    create_table :program_parameters do |t|

    t.integer "repository_id",                            :null => false
    t.integer "program_config_id",                        :null => false
    t.integer "program_parameter_type_id",                :null => false
    t.binary  "name",                      :limit => 200, :null => false
    t.binary  "description",               :limit => 200
    t.binary  "minValue",                  :limit => 200
    t.binary  "maxValue",                  :limit => 200
    t.binary  "def",                       :limit => 200
  end

  add_index "program_parameters", ["program_config_id", "name", "repository_id"], :name => "index3", :unique => true, :length => {"name" => 200}
  add_index "program_parameters", ["program_config_id"], :name => "fk_programParameter_1"
  add_index "program_parameters", ["program_config_id"], :name => "fk_program_parameter_1"
  add_index "program_parameters", ["program_parameter_type_id"], :name => "fk_program_parameters_1"
  add_index "program_parameters", ["repository_id"], :name => "fk_programParameter_2"
  end
end
