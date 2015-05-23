class CreateProgramConfigs < ActiveRecord::Migration
  def change
    create_table :program_configs do |t|

    t.integer "repository_id",                                                           :null => false
    t.integer "program_id",                                                              :null => false
    t.integer "run_result_format_id",                                                    :null => false
    t.integer "program_config_id"
    t.binary  "name",                                                     :limit => 767, :null => false
    t.binary  "abs_path",                                                  :limit => 767, :null => false
    t.binary  "invocation_format",                                         :limit => 767
    t.binary  "invocation_format_without_gold_standard",                      :limit => 767
    t.binary  "invocation_format_parameter_optimization",                    :limit => 767
    t.binary  "invocation_format_parameter_optimization_without_gold_standard", :limit => 767
    t.integer "expects_normalized_data_set"
  end

  add_index "program_configs", ["abs_path", "repository_id"], :name => "program_configs_abs_path_UNIQUE", :unique => true, :length => {"abs_path" => 767}
  add_index "program_configs", ["program_config_id"], :name => "fk_program_configs_3"
  add_index "program_configs", ["program_id"], :name => "fk_programConfigs_1"
  add_index "program_configs", ["program_id"], :name => "fk_program_configs_2"
  add_index "program_configs", ["repository_id"], :name => "fk_programConfigs_2"
  add_index "program_configs", ["run_result_format_id"], :name => "fk_program_configs_4"
  end
end
