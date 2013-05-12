class CreateViewRunResultDataAnalysisDataConfigsStatistics < ActiveRecord::Migration
  def up
  	execute "create view run_result_data_analysis_data_configs_statistics as select runRes.id as run_result_id, runResDataAna.id as run_results_data_analysis_id, runRes.uniqueRunIdentifier, runRes.absPath, runDataAnaDataConf.data_config_id, runAnaStats.statistic_id from run_results_data_analyses runResDataAna, run_results_analyses runResAna, run_results runRes, runs run, run_analyses runAna, run_analysis_statistics runAnaStats, run_data_analyses runDataAna, run_data_analysis_data_configs runDataAnaDataConf where runResDataAna.run_results_analysis_id = runResAna.id and runResAna.run_result_id = runRes.id and runRes.run_id = run.id and runAna.run_id = run.id and runAnaStats.run_analysis_id = runAna.id and runDataAna.run_analysis_id = runAna.id and runDataAnaDataConf.run_data_analysis_id = runDataAna.id"
  end

  def down
  end
end
