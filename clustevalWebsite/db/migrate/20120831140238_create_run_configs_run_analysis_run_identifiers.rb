class CreateRunConfigsRunAnalysisRunIdentifiers < ActiveRecord::Migration
  def change
    create_table :run_run_analysis_run_identifiers do |t|

    t.integer "repository_id",                      :null => false
    t.integer "run_run_analysis_id",                :null => false
    t.binary  "runIdentifier",       :limit => 200, :null => false
  end

  add_index "run_run_analysis_run_identifiers", ["repository_id", "run_run_analysis_id", "runIdentifier"], :name => "index5", :unique => true, :length => {"runIdentifier" => 200}
  add_index "run_run_analysis_run_identifiers", ["repository_id"], :name => "fk_runConfigsAnalysisRunRunIdentifiers_1"
  add_index "run_run_analysis_run_identifiers", ["runIdentifier"], :name => "fk_runConfigsAnalysisRunRunIdentifiers_3", :length => {"runIdentifier" => 200}
  add_index "run_run_analysis_run_identifiers", ["run_run_analysis_id"], :name => "fk_runConfigsAnalysisRunRunIdentifiers_2"
  end
end
