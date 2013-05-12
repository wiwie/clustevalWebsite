class CreateRunConfigsDataAnalysisDataConfigs < ActiveRecord::Migration
  def change
    create_table :run_data_analysis_data_configs do |t|

    t.integer "repository_id",        :null => false
    t.integer "run_data_analysis_id", :null => false
    t.integer "data_config_id",       :null => false
  end

  add_index "run_data_analysis_data_configs", ["data_config_id"], :name => "fk_runConfigsAnalysisDataDataConfigs_3"
  add_index "run_data_analysis_data_configs", ["repository_id"], :name => "fk_runConfigsAnalysisDataDataConfigs_1"
  add_index "run_data_analysis_data_configs", ["run_data_analysis_id", "data_config_id", "repository_id"], :name => "index5", :unique => true
  add_index "run_data_analysis_data_configs", ["run_data_analysis_id"], :name => "fk_runConfigsAnalysisDataDataConfigs_2"
  end
end
