class CreateProgramConfigs < ActiveRecord::Migration
  def change
    create_table :program_configs do |t|

    t.integer "repository_id",                                                           :null => false
    t.integer "program_id",                                                              :null => false
    t.integer "run_result_format_id",                                                    :null => false
    t.integer "program_config_id"
    t.binary  "name",                                                     :limit => 200, :null => false
    t.binary  "absPath",                                                  :limit => 200, :null => false
    t.binary  "invocationFormat",                                         :limit => 200
    t.binary  "invocationFormatWithoutGoldStandard",                      :limit => 200
    t.binary  "invocationFormatParameterOptimization",                    :limit => 200
    t.binary  "invocationFormatParameterOptimizationWithoutGoldStandard", :limit => 200
    t.integer "expectsNormalizedDataSet"
  end

  add_index "program_configs", ["absPath", "repository_id"], :name => "absPath_UNIQUE", :unique => true, :length => {"absPath" => 200}
  add_index "program_configs", ["program_config_id"], :name => "fk_program_configs_3"
  add_index "program_configs", ["program_id"], :name => "fk_programConfigs_1"
  add_index "program_configs", ["program_id"], :name => "fk_program_configs_2"
  add_index "program_configs", ["repository_id"], :name => "fk_programConfigs_2"
  add_index "program_configs", ["run_result_format_id"], :name => "fk_program_configs_4"
  end
end
