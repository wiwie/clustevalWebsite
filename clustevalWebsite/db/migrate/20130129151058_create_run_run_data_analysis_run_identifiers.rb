class CreateRunRunDataAnalysisRunIdentifiers < ActiveRecord::Migration
  def change
    create_table :run_run_data_analysis_run_identifiers do |t|

    t.integer "repository_id",                           :null => false
    t.integer "run_run_data_analysis_id",                :null => false
    t.binary  "run_identifier",           :limit => 767, :null => false
  end

  add_index "run_run_data_analysis_run_identifiers", ["repository_id", "run_run_data_analysis_id", "run_identifier"], :name => "run_run_data_analysis_run_identifiers_index4", :unique => true, :length => {"run_identifier" => 767}
  add_index "run_run_data_analysis_run_identifiers", ["repository_id"], :name => "fk_runs_run_data_analysis_run_identifiers_1"
  add_index "run_run_data_analysis_run_identifiers", ["run_run_data_analysis_id"], :name => "fk_runs_run_data_analysis_run_identifiers_2"
  end
end
