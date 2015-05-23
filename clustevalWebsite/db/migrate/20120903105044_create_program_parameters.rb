class CreateProgramParameters < ActiveRecord::Migration
  def change
    create_table :program_parameters do |t|

    t.integer "repository_id",                            :null => false
    t.integer "program_config_id",                        :null => false
    t.integer "program_parameter_type_id",                :null => false
    t.binary  "name",                      :limit => 767, :null => false
    t.binary  "description",               :limit => 767
    t.binary  "min_value",                  :limit => 767
    t.binary  "max_value",                  :limit => 767
    t.binary  "def",                       :limit => 767
  end

  add_index "program_parameters", ["program_config_id", "name", "repository_id"], :name => "program_parameters_index3", :unique => true, :length => {"name" => 767}
  add_index "program_parameters", ["program_config_id"], :name => "fk_programParameter_1"
  add_index "program_parameters", ["program_config_id"], :name => "fk_program_parameter_1"
  add_index "program_parameters", ["program_parameter_type_id"], :name => "fk_program_parameters_1"
  add_index "program_parameters", ["repository_id"], :name => "fk_programParameter_2"
  end
end
