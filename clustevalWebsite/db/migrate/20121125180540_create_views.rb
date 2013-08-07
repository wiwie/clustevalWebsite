class CreateViews < ActiveRecord::Migration
  def up
  	#execute "CREATE VIEW `dataset_statistics` AS select `ds`.`id` AS `dataset_id`,`anaDataConfigs`.`data_config_id` AS `data_config_id`,`res`.`id` AS `run_result_id`,`res`.`absPath` AS `absPath`,`res`.`run_id` AS `run_id`,`res`.`date` AS `date`,`stats`.`name` AS `statistic` from ((((((((((((`run_data_analysis_data_configs` `anaDataConfigs` join `data_configs` `dcs`) join `dataset_configs` `dscs`) join `datasets` `ds`) join `run_data_analyses` `runDataAna`) join `run_analyses` `runAna`) join `run_analysis_statistics` `runStats`) join `statistics` `stats`) join `runs`) join `runs` `runsOrig`) join `run_results` `res`) join `run_results_analyses` `resAna`) join `run_results_data_analyses` `resDataAna`) where ((`res`.`id` = `resAna`.`run_result_id`) and (`resAna`.`id` = `resDataAna`.`run_results_analysis_id`) and (`runs`.`id` = `res`.`run_id`) and (`runsOrig`.`id` = `runs`.`run_id`) and (`runsOrig`.`id` = `runAna`.`run_id`) and (`runDataAna`.`run_analysis_id` = `runAna`.`id`) and (`anaDataConfigs`.`run_data_analysis_id` = `runDataAna`.`id`) and (`anaDataConfigs`.`data_config_id` = `dcs`.`id`) and (`dcs`.`dataset_config_id` = `dscs`.`id`) and (`dscs`.`dataset_id` = `ds`.`id`) and (`runStats`.`run_analysis_id` = `runAna`.`id`) and (`stats`.`id` = `runStats`.`statistic_id`))"
  	#execute "CREATE VIEW `datasets_recent_statistics` AS select `dataset_statistics`.`dataset_id` AS `dataset_id`,`dataset_statistics`.`data_config_id` AS `data_config_id`,`dataset_statistics`.`run_result_id` AS `run_result_id`,`dataset_statistics`.`absPath` AS `absPath`,`dataset_statistics`.`run_id` AS `run_id`,`dataset_statistics`.`date` AS `date`,`dataset_statistics`.`statistic` AS `statistic` from `dataset_statistics` where (`dataset_statistics`.`dataset_id`,`dataset_statistics`.`statistic`,`dataset_statistics`.`date`) in (select `dataset_statistics`.`dataset_id`,`dataset_statistics`.`statistic`,max(`dataset_statistics`.`date`) AS `maxDate` from `dataset_statistics` group by `dataset_statistics`.`dataset_id`,`dataset_statistics`.`statistic`)"
  	execute "CREATE ALGORITHM=MERGE VIEW `parameter_optimization_iterations` AS select `iter`.`id` AS `run_results_parameter_optimizations_parameter_set_iteration_id`,`iter`.`iteration` AS `iteration`,`iter`.`paramSetAsString` AS `paramSetAsString`,`measure`.`id` AS `clustering_quality_measure_id`,`qual`.`quality` AS `quality`,`results`.`uniqueRunIdentifier` AS `uniqueRunIdentifier`,`opts`.`data_config_id` AS `data_config_id`,`opts`.`program_config_id` AS `program_config_id`,`progParams`.`name` AS `paramName`,`vals`.`value` AS `value` from (((((((((`run_results_parameter_optimizations_parameter_set_iterations` `iter` join `run_results_parameter_optimizations_parameter_sets` `sets`) join `run_results_parameter_optimizations` `opts`) join `run_results_executions` `exec`) join `run_results` `results`) join `run_results_parameter_optimizations_qualities` `qual`) join `run_results_parameter_optimizations_parameter_values` `vals`) join `run_results_parameter_optimizations_parameter_set_parameters` `params`) join `program_parameters` `progParams`) join `clustering_quality_measures` `measure`) where ((`results`.`id` = `exec`.`run_result_id`) and (`exec`.`id` = `opts`.`run_results_execution_id`) and (`opts`.`id` = `sets`.`run_results_parameter_optimization_id`) and (`sets`.`id` = `iter`.`run_results_parameter_optimizations_parameter_set_id`) and (`iter`.`id` = `qual`.`run_results_parameter_optimizations_parameter_set_iteration_id`) and (`measure`.`id` = `qual`.`clustering_quality_measure_id`) and (`vals`.`run_results_parameter_optimizations_parameter_set_iteration_id` = `iter`.`id`) and (`vals`.`run_results_parameter_optimizations_parameter_set_parameter_id` = `params`.`id`) and (`params`.`program_parameter_id` = `progParams`.`id`))"
  	execute "CREATE ALGORITHM=MERGE VIEW `parameter_optimization_iterations_exts` AS select `dscOrig`.`id` AS `dataset_config_id`,`ps`.`id` AS `program_id`,`it`.`clustering_quality_measure_id` AS `clustering_quality_measure_id`,`it`.`quality` AS `quality`,`it`.`paramSetAsString` AS `paramSetAsString` from (((((`programs` `ps` join `dataset_configs` `dscOrig`) join `dataset_configs` `dscs`) join `data_configs` `dcs`) join `program_configs` `pcs`) join `parameter_optimization_iterations` `it`) where ((`it`.`data_config_id` = `dcs`.`id`) and (`it`.`program_config_id` = `pcs`.`id`) and (`dcs`.`dataset_config_id` = `dscs`.`id`) and (`pcs`.`program_id` = `ps`.`id`) and (`dscOrig`.id = `dscs`.dataset_config_id)) union select dscOrig.id as `dataset_config_id`,ps.id as `program_id`,clustering_quality_measure_id,quality,paramString as `paramSetAsString` from (run_results_clustering_qualities `quals` join program_configs `pcs` join program_configs `pcOrig` join programs `ps` join data_configs `dcs` join dataset_configs `dscs` join dataset_configs `dscOrig`) where (`quals`.data_config_id = `dcs`.id) and (`dcs`.dataset_config_id = `dscs`.id) and (`dscs`.dataset_config_id = `dscOrig`.id) and (`quals`.program_config_id = `pcs`.id) and (`pcs`.program_config_id = `pcOrig`.id) and (`pcOrig`.program_id = `ps`.id)"
  	##execute "CREATE ALGORITHM=MERGE VIEW `parameter_optimization_max_quals` AS select dataset_id,program_id,clustering_quality_measure_id,max(quality) as maxQuality from parameter_optimization_iterations_exts group by dataset_id,program_id,clustering_quality_measure_id;"
    #execute "CREATE ALGORITHM=MERGE VIEW `parameter_optimization_max_qual_rows` AS select iter.* from parameter_optimization_iterations_exts iter inner join parameter_optimization_max_quals groupediter on iter.dataset_id = groupediter.dataset_id and iter.program_id = groupediter.program_id and iter.clustering_quality_measure_id = groupediter.clustering_quality_measure_id and iter.quality = groupediter.maxQuality;"
    #execute "CREATE ALGORITHM=MERGE VIEW `parameter_optimization_min_quals` AS select dataset_id,program_id,clustering_quality_measure_id,min(quality) as minQuality from parameter_optimization_iterations_exts group by dataset_id,program_id,clustering_quality_measure_id;"
    #execute "CREATE ALGORITHM=MERGE VIEW `parameter_optimization_min_qual_rows` AS select iter.* from parameter_optimization_iterations_exts iter inner join parameter_optimization_min_quals groupediter on iter.dataset_id = groupediter.dataset_id and iter.program_id = groupediter.program_id and iter.clustering_quality_measure_id = groupediter.clustering_quality_measure_id and iter.quality = groupediter.minQuality;"
  	#execute "CREATE VIEW `run_results_data_configs_rankings` AS select `run_results_parameter_optimizations_parameter_set_iterations`.`id` AS `t0_r0`,`run_results_parameter_optimizations_parameter_set_iterations`.`run_results_parameter_optimizations_parameter_set_id` AS `t0_r1`,`run_results_parameter_optimizations_parameter_set_iterations`.`iteration` AS `t0_r2`,`run_results_parameter_optimizations_parameter_set_iterations`.`paramSetAsString` AS `t0_r3`,`run_results_parameter_optimizations_parameter_values`.`id` AS `t1_r0`,`run_results_parameter_optimizations_parameter_values`.`repository_id` AS `t1_r1`,`run_results_parameter_optimizations_parameter_values`.`run_results_parameter_optimizations_parameter_set_iteration_id` AS `t1_r2`,`run_results_parameter_optimizations_parameter_values`.`run_results_parameter_optimizations_parameter_set_parameter_id` AS `t1_r3`,`run_results_parameter_optimizations_parameter_values`.`value` AS `t1_r4`,`run_results_parameter_optimizations_parameter_set_parameters`.`id` AS `t2_r0`,`run_results_parameter_optimizations_parameter_set_parameters`.`repository_id` AS `t2_r1`,`run_results_parameter_optimizations_parameter_set_parameters`.`run_results_parameter_optimizations_parameter_set_id` AS `t2_r2`,`run_results_parameter_optimizations_parameter_set_parameters`.`program_parameter_id` AS `t2_r3`,`program_parameters`.`id` AS `t3_r0`,`program_parameters`.`repository_id` AS `t3_r1`,`program_parameters`.`program_config_id` AS `t3_r2`,`program_parameters`.`program_parameter_type_id` AS `t3_r3`,`program_parameters`.`name` AS `t3_r4`,`program_parameters`.`description` AS `t3_r5`,`program_parameters`.`minValue` AS `t3_r6`,`program_parameters`.`maxValue` AS `t3_r7`,`program_parameters`.`def` AS `t3_r8`,`run_results_parameter_optimizations_qualities`.`id` AS `t4_r0`,`run_results_parameter_optimizations_qualities`.`repository_id` AS `t4_r1`,`run_results_parameter_optimizations_qualities`.`run_results_parameter_optimizations_parameter_set_iteration_id` AS `t4_r2`,`run_results_parameter_optimizations_qualities`.`clustering_quality_measure_id` AS `t4_r3`,`run_results_parameter_optimizations_qualities`.`quality` AS `t4_r4`,`clustering_quality_measures`.`id` AS `t5_r0`,`clustering_quality_measures`.`repository_id` AS `t5_r1`,`clustering_quality_measures`.`name` AS `t5_r2`,`clustering_quality_measures`.`minValue` AS `t5_r3`,`clustering_quality_measures`.`maxValue` AS `t5_r4`,`clustering_quality_measures`.`requiresGoldStandard` AS `t5_r5`,`run_results_parameter_optimizations_parameter_sets`.`id` AS `t6_r0`,`run_results_parameter_optimizations_parameter_sets`.`repository_id` AS `t6_r1`,`run_results_parameter_optimizations_parameter_sets`.`run_results_parameter_optimization_id` AS `t6_r2`,`run_results_parameter_optimizations_parameter_set_parameters_run_results_parameter_optimizations_parameter_sets`.`id` AS `t7_r0`,`run_results_parameter_optimizations_parameter_set_parameters_run_results_parameter_optimizations_parameter_sets`.`repository_id` AS `t7_r1`,`run_results_parameter_optimizations_parameter_set_parameters_run_results_parameter_optimizations_parameter_sets`.`run_results_parameter_optimizations_parameter_set_id` AS `t7_r2`,`run_results_parameter_optimizations_parameter_set_parameters_run_results_parameter_optimizations_parameter_sets`.`program_parameter_id` AS `t7_r3`,`program_parameters_run_results_parameter_optimizations_parameter_set_parameters`.`id` AS `t8_r0`,`program_parameters_run_results_parameter_optimizations_parameter_set_parameters`.`repository_id` AS `t8_r1`,`program_parameters_run_results_parameter_optimizations_parameter_set_parameters`.`program_config_id` AS `t8_r2`,`program_parameters_run_results_parameter_optimizations_parameter_set_parameters`.`program_parameter_type_id` AS `t8_r3`,`program_parameters_run_results_parameter_optimizations_parameter_set_parameters`.`name` AS `t8_r4`,`program_parameters_run_results_parameter_optimizations_parameter_set_parameters`.`description` AS `t8_r5`,`program_parameters_run_results_parameter_optimizations_parameter_set_parameters`.`minValue` AS `t8_r6`,`program_parameters_run_results_parameter_optimizations_parameter_set_parameters`.`maxValue` AS `t8_r7`,`program_parameters_run_results_parameter_optimizations_parameter_set_parameters`.`def` AS `t8_r8`,`run_results_parameter_optimizations`.`id` AS `t9_r0`,`run_results_parameter_optimizations`.`repository_id` AS `t9_r1`,`run_results_parameter_optimizations`.`run_results_execution_id` AS `t9_r2`,`run_results_parameter_optimizations`.`data_config_id` AS `t9_r3`,`run_results_parameter_optimizations`.`program_config_id` AS `t9_r4`,`run_results_parameter_optimizations`.`absPath` AS `t9_r5`,`program_configs`.`id` AS `t10_r0`,`program_configs`.`repository_id` AS `t10_r1`,`program_configs`.`program_id` AS `t10_r2`,`program_configs`.`program_config_id` AS `t10_r4`,`program_configs`.`name` AS `t10_r5`,`program_configs`.`absPath` AS `t10_r6`,`program_configs`.`invocationFormat` AS `t10_r7`,`program_configs`.`invocationFormatWithoutGoldStandard` AS `t10_r8`,`program_configs`.`invocationFormatParameterOptimization` AS `t10_r9`,`program_configs`.`invocationFormatParameterOptimizationWithoutGoldStandard` AS `t10_r10`,`program_configs`.`expectsNormalizedDataSet` AS `t10_r11`,`run_results_executions`.`id` AS `t11_r0`,`run_results_executions`.`repository_id` AS `t11_r1`,`run_results_executions`.`run_result_id` AS `t11_r2`,`run_results`.`id` AS `t12_r0`,`run_results`.`repository_id` AS `t12_r1`,`run_results`.`run_type_id` AS `t12_r2`,`run_results`.`uniqueRunIdentifier` AS `t12_r3`,`run_results`.`run_id` AS `t12_r4`,`run_results`.`date` AS `t12_r5` from ((((((((((((`run_results_parameter_optimizations_parameter_set_iterations` left join `run_results_parameter_optimizations_parameter_values` on((`run_results_parameter_optimizations_parameter_values`.`run_results_parameter_optimizations_parameter_set_iteration_id` = `run_results_parameter_optimizations_parameter_set_iterations`.`id`))) left join `run_results_parameter_optimizations_parameter_set_parameters` on((`run_results_parameter_optimizations_parameter_set_parameters`.`id` = `run_results_parameter_optimizations_parameter_values`.`run_results_parameter_optimizations_parameter_set_parameter_id`))) left join `program_parameters` on((`program_parameters`.`id` = `run_results_parameter_optimizations_parameter_set_parameters`.`program_parameter_id`))) left join `run_results_parameter_optimizations_qualities` on((`run_results_parameter_optimizations_qualities`.`run_results_parameter_optimizations_parameter_set_iteration_id` = `run_results_parameter_optimizations_parameter_set_iterations`.`id`))) left join `clustering_quality_measures` on((`clustering_quality_measures`.`id` = `run_results_parameter_optimizations_qualities`.`clustering_quality_measure_id`))) left join `run_results_parameter_optimizations_parameter_sets` on((`run_results_parameter_optimizations_parameter_sets`.`id` = `run_results_parameter_optimizations_parameter_set_iterations`.`run_results_parameter_optimizations_parameter_set_id`))) left join `run_results_parameter_optimizations_parameter_set_parameters` `run_results_parameter_optimizations_parameter_set_parameters_run_results_parameter_optimizations_parameter_sets` on((`run_results_parameter_optimizations_parameter_set_parameters_run_results_parameter_optimizations_parameter_sets`.`run_results_parameter_optimizations_parameter_set_id` = `run_results_parameter_optimizations_parameter_sets`.`id`))) left join `program_parameters` `program_parameters_run_results_parameter_optimizations_parameter_set_parameters` on((`program_parameters_run_results_parameter_optimizations_parameter_set_parameters`.`id` = `run_results_parameter_optimizations_parameter_set_parameters_run_results_parameter_optimizations_parameter_sets`.`program_parameter_id`))) left join `run_results_parameter_optimizations` on((`run_results_parameter_optimizations`.`id` = `run_results_parameter_optimizations_parameter_sets`.`run_results_parameter_optimization_id`))) left join `program_configs` on((`program_configs`.`id` = `run_results_parameter_optimizations`.`program_config_id`))) left join `run_results_executions` on((`run_results_executions`.`id` = `run_results_parameter_optimizations`.`run_results_execution_id`))) left join `run_results` on((`run_results`.`id` = `run_results_executions`.`run_result_id`)))"
  	#execute "CREATE VIEW `run_results_program_configs_rankings` AS select `run_results_parameter_optimizations_parameter_set_iterations`.`id` AS `t0_r0`,`run_results_parameter_optimizations_parameter_set_iterations`.`run_results_parameter_optimizations_parameter_set_id` AS `t0_r1`,`run_results_parameter_optimizations_parameter_set_iterations`.`iteration` AS `t0_r2`,`run_results_parameter_optimizations_parameter_set_iterations`.`paramSetAsString` AS `t0_r3`,`run_results_parameter_optimizations_parameter_values`.`id` AS `t1_r0`,`run_results_parameter_optimizations_parameter_values`.`repository_id` AS `t1_r1`,`run_results_parameter_optimizations_parameter_values`.`run_results_parameter_optimizations_parameter_set_iteration_id` AS `t1_r2`,`run_results_parameter_optimizations_parameter_values`.`run_results_parameter_optimizations_parameter_set_parameter_id` AS `t1_r3`,`run_results_parameter_optimizations_parameter_values`.`value` AS `t1_r4`,`run_results_parameter_optimizations_parameter_set_parameters`.`id` AS `t2_r0`,`run_results_parameter_optimizations_parameter_set_parameters`.`repository_id` AS `t2_r1`,`run_results_parameter_optimizations_parameter_set_parameters`.`run_results_parameter_optimizations_parameter_set_id` AS `t2_r2`,`run_results_parameter_optimizations_parameter_set_parameters`.`program_parameter_id` AS `t2_r3`,`program_parameters`.`id` AS `t3_r0`,`program_parameters`.`repository_id` AS `t3_r1`,`program_parameters`.`program_config_id` AS `t3_r2`,`program_parameters`.`program_parameter_type_id` AS `t3_r3`,`program_parameters`.`name` AS `t3_r4`,`program_parameters`.`description` AS `t3_r5`,`program_parameters`.`minValue` AS `t3_r6`,`program_parameters`.`maxValue` AS `t3_r7`,`program_parameters`.`def` AS `t3_r8`,`run_results_parameter_optimizations_qualities`.`id` AS `t4_r0`,`run_results_parameter_optimizations_qualities`.`repository_id` AS `t4_r1`,`run_results_parameter_optimizations_qualities`.`run_results_parameter_optimizations_parameter_set_iteration_id` AS `t4_r2`,`run_results_parameter_optimizations_qualities`.`clustering_quality_measure_id` AS `t4_r3`,`run_results_parameter_optimizations_qualities`.`quality` AS `t4_r4`,`clustering_quality_measures`.`id` AS `t5_r0`,`clustering_quality_measures`.`repository_id` AS `t5_r1`,`clustering_quality_measures`.`name` AS `t5_r2`,`clustering_quality_measures`.`minValue` AS `t5_r3`,`clustering_quality_measures`.`maxValue` AS `t5_r4`,`clustering_quality_measures`.`requiresGoldStandard` AS `t5_r5`,`run_results_parameter_optimizations_parameter_sets`.`id` AS `t6_r0`,`run_results_parameter_optimizations_parameter_sets`.`repository_id` AS `t6_r1`,`run_results_parameter_optimizations_parameter_sets`.`run_results_parameter_optimization_id` AS `t6_r2`,`run_results_parameter_optimizations_parameter_set_parameters_run_results_parameter_optimizations_parameter_sets`.`id` AS `t7_r0`,`run_results_parameter_optimizations_parameter_set_parameters_run_results_parameter_optimizations_parameter_sets`.`repository_id` AS `t7_r1`,`run_results_parameter_optimizations_parameter_set_parameters_run_results_parameter_optimizations_parameter_sets`.`run_results_parameter_optimizations_parameter_set_id` AS `t7_r2`,`run_results_parameter_optimizations_parameter_set_parameters_run_results_parameter_optimizations_parameter_sets`.`program_parameter_id` AS `t7_r3`,`program_parameters_run_results_parameter_optimizations_parameter_set_parameters`.`id` AS `t8_r0`,`program_parameters_run_results_parameter_optimizations_parameter_set_parameters`.`repository_id` AS `t8_r1`,`program_parameters_run_results_parameter_optimizations_parameter_set_parameters`.`program_config_id` AS `t8_r2`,`program_parameters_run_results_parameter_optimizations_parameter_set_parameters`.`program_parameter_type_id` AS `t8_r3`,`program_parameters_run_results_parameter_optimizations_parameter_set_parameters`.`name` AS `t8_r4`,`program_parameters_run_results_parameter_optimizations_parameter_set_parameters`.`description` AS `t8_r5`,`program_parameters_run_results_parameter_optimizations_parameter_set_parameters`.`minValue` AS `t8_r6`,`program_parameters_run_results_parameter_optimizations_parameter_set_parameters`.`maxValue` AS `t8_r7`,`program_parameters_run_results_parameter_optimizations_parameter_set_parameters`.`def` AS `t8_r8`,`run_results_parameter_optimizations`.`id` AS `t9_r0`,`run_results_parameter_optimizations`.`repository_id` AS `t9_r1`,`run_results_parameter_optimizations`.`run_results_execution_id` AS `t9_r2`,`run_results_parameter_optimizations`.`data_config_id` AS `t9_r3`,`run_results_parameter_optimizations`.`program_config_id` AS `t9_r4`,`run_results_parameter_optimizations`.`absPath` AS `t9_r5`,`program_configs`.`id` AS `t10_r0`,`program_configs`.`repository_id` AS `t10_r1`,`program_configs`.`program_id` AS `t10_r2`,`program_configs`.`program_config_id` AS `t10_r4`,`program_configs`.`name` AS `t10_r5`,`program_configs`.`absPath` AS `t10_r6`,`program_configs`.`invocationFormat` AS `t10_r7`,`program_configs`.`invocationFormatWithoutGoldStandard` AS `t10_r8`,`program_configs`.`invocationFormatParameterOptimization` AS `t10_r9`,`program_configs`.`invocationFormatParameterOptimizationWithoutGoldStandard` AS `t10_r10`,`program_configs`.`expectsNormalizedDataSet` AS `t10_r11`,`run_results_executions`.`id` AS `t11_r0`,`run_results_executions`.`repository_id` AS `t11_r1`,`run_results_executions`.`run_result_id` AS `t11_r2`,`run_results`.`id` AS `t12_r0`,`run_results`.`repository_id` AS `t12_r1`,`run_results`.`run_type_id` AS `t12_r2`,`run_results`.`uniqueRunIdentifier` AS `t12_r3`,`run_results`.`run_id` AS `t12_r4`,`run_results`.`date` AS `t12_r5` from ((((((((((((`run_results_parameter_optimizations_parameter_set_iterations` left join `run_results_parameter_optimizations_parameter_values` on((`run_results_parameter_optimizations_parameter_values`.`run_results_parameter_optimizations_parameter_set_iteration_id` = `run_results_parameter_optimizations_parameter_set_iterations`.`id`))) left join `run_results_parameter_optimizations_parameter_set_parameters` on((`run_results_parameter_optimizations_parameter_set_parameters`.`id` = `run_results_parameter_optimizations_parameter_values`.`run_results_parameter_optimizations_parameter_set_parameter_id`))) left join `program_parameters` on((`program_parameters`.`id` = `run_results_parameter_optimizations_parameter_set_parameters`.`program_parameter_id`))) left join `run_results_parameter_optimizations_qualities` on((`run_results_parameter_optimizations_qualities`.`run_results_parameter_optimizations_parameter_set_iteration_id` = `run_results_parameter_optimizations_parameter_set_iterations`.`id`))) left join `clustering_quality_measures` on((`clustering_quality_measures`.`id` = `run_results_parameter_optimizations_qualities`.`clustering_quality_measure_id`))) left join `run_results_parameter_optimizations_parameter_sets` on((`run_results_parameter_optimizations_parameter_sets`.`id` = `run_results_parameter_optimizations_parameter_set_iterations`.`run_results_parameter_optimizations_parameter_set_id`))) left join `run_results_parameter_optimizations_parameter_set_parameters` `run_results_parameter_optimizations_parameter_set_parameters_run_results_parameter_optimizations_parameter_sets` on((`run_results_parameter_optimizations_parameter_set_parameters_run_results_parameter_optimizations_parameter_sets`.`run_results_parameter_optimizations_parameter_set_id` = `run_results_parameter_optimizations_parameter_sets`.`id`))) left join `program_parameters` `program_parameters_run_results_parameter_optimizations_parameter_set_parameters` on((`program_parameters_run_results_parameter_optimizations_parameter_set_parameters`.`id` = `run_results_parameter_optimizations_parameter_set_parameters_run_results_parameter_optimizations_parameter_sets`.`program_parameter_id`))) left join `run_results_parameter_optimizations` on((`run_results_parameter_optimizations`.`id` = `run_results_parameter_optimizations_parameter_sets`.`run_results_parameter_optimization_id`))) left join `program_configs` on((`program_configs`.`id` = `run_results_parameter_optimizations`.`program_config_id`))) left join `run_results_executions` on((`run_results_executions`.`id` = `run_results_parameter_optimizations`.`run_results_execution_id`))) left join `run_results` on((`run_results`.`id` = `run_results_executions`.`run_result_id`)))"
  end

  def down
  end
end
