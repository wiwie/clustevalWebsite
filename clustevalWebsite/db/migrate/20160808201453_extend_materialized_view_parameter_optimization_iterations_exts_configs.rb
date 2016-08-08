class ExtendMaterializedViewParameterOptimizationIterationsExtsConfigs < ActiveRecord::Migration
  def up
  	execute "DROP MATERIALIZED VIEW parameter_optimization_iterations_exts_configs;"
  	execute "CREATE MATERIALIZED VIEW parameter_optimization_iterations_exts_configs AS 
  	select iter.id AS run_results_parameter_optimizations_parameter_set_iteration_id,
	iter.iteration AS iteration,
	iter.param_set_as_string AS param_set_as_string,
	measure.id AS clustering_quality_measure_id,
	qual.quality AS quality,
	results.unique_run_identifier AS unique_run_identifier,
	datasets.dataset_id AS dataset_id,
	dataconfigs.data_config_id AS data_config_id,
	programconfigs.program_config_id AS program_config_id,
	programconfigs.program_id AS program_id,
	progParams.name AS paramName,
	vals.value AS value 
  	from run_results_parameter_optimizations_parameter_set_iterations iter, 
  	run_results_parameter_optimizations_parameter_sets sets, run_results_parameter_optimizations opts, 
  	program_configs programconfigs, data_configs dataconfigs, run_results_executions exec, run_results results, 
  	run_results_parameter_optimizations_qualities qual, run_results_parameter_optimizations_parameter_values vals, 
  	run_results_parameter_optimizations_parameter_set_parameters params, program_parameters progParams, 
  	clustering_quality_measures measure,
  	dataset_configs,
  	datasets
  	where ((opts.program_config_id = programconfigs.id) and 
  	(opts.data_config_id = dataconfigs.id) and 
  	(dataset_configs.id = dataconfigs.dataset_config_id) and
  	(datasets.id=dataset_configs.dataset_id) and
  	(results.id = exec.run_result_id) and 
  	(exec.id = opts.run_results_execution_id) and 
  	(opts.id = sets.run_results_parameter_optimization_id) and 
  	(sets.id = iter.run_results_parameter_optimizations_parameter_set_id) and 
  	(iter.id = qual.run_results_parameter_optimizations_parameter_set_iteration_id) and 
  	(measure.id = qual.clustering_quality_measure_id) and 
  	(vals.run_results_parameter_optimizations_parameter_set_iteration_id = iter.id) and 
  	(vals.run_results_parameter_optimizations_parameter_set_parameter_id = params.id) and 
  	(params.program_parameter_id = progParams.id));"
  end
end
