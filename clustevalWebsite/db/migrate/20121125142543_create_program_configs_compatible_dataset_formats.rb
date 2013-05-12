class CreateProgramConfigsCompatibleDatasetFormats < ActiveRecord::Migration
  def change
    create_table :program_configs_compatible_dataset_formats do |t|
    t.integer "id",                :null => false
    t.integer "repository_id",     :null => false
    t.integer "program_config_id", :null => false
    t.integer "dataset_format_id", :null => false
  end

  add_index "program_configs_compatible_dataset_formats", ["dataset_format_id"], :name => "fk_program_configs_compatible_dataset_formats_3"
  add_index "program_configs_compatible_dataset_formats", ["dataset_format_id"], :name => "fk_programsCompatibleDataSetFormats_2"
  add_index "program_configs_compatible_dataset_formats", ["program_config_id"], :name => "fk_program_configs_compatible_dataset_formats_2"
  add_index "program_configs_compatible_dataset_formats", ["program_config_id"], :name => "fk_programsCompatibleDataSetFormats_1"
  add_index "program_configs_compatible_dataset_formats", ["repository_id", "program_config_id", "dataset_format_id"], :name => "index5", :unique => true
  add_index "program_configs_compatible_dataset_formats", ["repository_id"], :name => "fk_program_configs_compatible_dataset_formats_1"
  add_index "program_configs_compatible_dataset_formats", ["repository_id"], :name => "fk_programs_compatible_dataset_formats_1"
  end
end
