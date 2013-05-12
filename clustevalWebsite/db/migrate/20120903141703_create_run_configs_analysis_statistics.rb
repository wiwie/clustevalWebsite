class CreateRunConfigsAnalysisStatistics < ActiveRecord::Migration
  def change
    create_table :run_analysis_statistics do |t|

    t.integer "repository_id",   :null => false
    t.integer "run_analysis_id", :null => false
    t.integer "statistic_id",    :null => false
  end

  add_index "run_analysis_statistics", ["repository_id", "run_analysis_id", "statistic_id"], :name => "index5", :unique => true
  add_index "run_analysis_statistics", ["repository_id"], :name => "fk_runConfigsAnalysisStatistics_1"
  add_index "run_analysis_statistics", ["run_analysis_id"], :name => "fk_runConfigsAnalysisStatistics_2"
  add_index "run_analysis_statistics", ["statistic_id"], :name => "fk_runConfigsAnalysisStatistics_3"
  end
end
