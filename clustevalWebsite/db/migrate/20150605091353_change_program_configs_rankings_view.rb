class ChangeProgramConfigsRankingsView < ActiveRecord::Migration
  def up
  	execute "drop materialized view run_results_program_configs_rankings"
  	execute "CREATE MATERIALIZED VIEW run_results_program_configs_rankings AS 
 SELECT run_results_parameter_optimizations_parameter_set_iterations.id AS t0_r0,
    run_results_parameter_optimizations_parameter_set_iterations.run_results_parameter_optimizations_parameter_set_id AS t0_r1,
    run_results_parameter_optimizations_parameter_set_iterations.iteration AS t0_r2,
    run_results_parameter_optimizations_parameter_set_iterations.param_set_as_string AS t0_r3,
    run_results_parameter_optimizations_parameter_values.id AS t1_r0,
    run_results_parameter_optimizations_parameter_values.repository_id AS t1_r1,
    run_results_parameter_optimizations_parameter_values.run_results_parameter_optimizations_parameter_set_iteration_id AS t1_r2,
    run_results_parameter_optimizations_parameter_values.run_results_parameter_optimizations_parameter_set_parameter_id AS t1_r3,
    run_results_parameter_optimizations_parameter_values.value AS t1_r4,
    run_results_parameter_optimizations_parameter_set_parameters.id AS t2_r0,
    run_results_parameter_optimizations_parameter_set_parameters.repository_id AS t2_r1,
    run_results_parameter_optimizations_parameter_set_parameters.run_results_parameter_optimizations_parameter_set_id AS t2_r2,
    run_results_parameter_optimizations_parameter_set_parameters.program_parameter_id AS t2_r3,
    program_parameters.id AS t3_r0,
    program_parameters.repository_id AS t3_r1,
    program_parameters.program_config_id AS t3_r2,
    program_parameters.program_parameter_type_id AS t3_r3,
    program_parameters.name AS t3_r4,
    program_parameters.description AS t3_r5,
    program_parameters.min_value AS t3_r6,
    program_parameters.max_value AS t3_r7,
    program_parameters.def AS t3_r8,
    run_results_parameter_optimizations_qualities.id AS t4_r0,
    run_results_parameter_optimizations_qualities.repository_id AS t4_r1,
    run_results_parameter_optimizations_qualities.run_results_parameter_optimizations_parameter_set_iteration_id AS t4_r2,
    run_results_parameter_optimizations_qualities.clustering_quality_measure_id AS t4_r3,
    run_results_parameter_optimizations_qualities.quality AS t4_r4,
    clustering_quality_measures.id AS t5_r0,
    clustering_quality_measures.repository_id AS t5_r1,
    clustering_quality_measures.name AS t5_r2,
    clustering_quality_measures.min_value AS t5_r3,
    clustering_quality_measures.max_value AS t5_r4,
    clustering_quality_measures.requires_gold_standard AS t5_r5,
    run_results_parameter_optimizations_parameter_sets.id AS t6_r0,
    run_results_parameter_optimizations_parameter_sets.repository_id AS t6_r1,
    run_results_parameter_optimizations_parameter_sets.run_results_parameter_optimization_id AS t6_r2,
    run_results_parameter_optimizations_parameter_set_parameters_ru.id AS t7_r0,
    run_results_parameter_optimizations_parameter_set_parameters_ru.repository_id AS t7_r1,
    run_results_parameter_optimizations_parameter_set_parameters_ru.run_results_parameter_optimizations_parameter_set_id AS t7_r2,
    run_results_parameter_optimizations_parameter_set_parameters_ru.program_parameter_id AS t7_r3,
    program_parameters_run_results_parameter_optimizations_paramete.id AS t8_r0,
    program_parameters_run_results_parameter_optimizations_paramete.repository_id AS t8_r1,
    program_parameters_run_results_parameter_optimizations_paramete.program_config_id AS t8_r2,
    program_parameters_run_results_parameter_optimizations_paramete.program_parameter_type_id AS t8_r3,
    program_parameters_run_results_parameter_optimizations_paramete.name AS t8_r4,
    program_parameters_run_results_parameter_optimizations_paramete.description AS t8_r5,
    program_parameters_run_results_parameter_optimizations_paramete.min_value AS t8_r6,
    program_parameters_run_results_parameter_optimizations_paramete.max_value AS t8_r7,
    program_parameters_run_results_parameter_optimizations_paramete.def AS t8_r8,
    run_results_parameter_optimizations.id AS t9_r0,
    run_results_parameter_optimizations.repository_id AS t9_r1,
    run_results_parameter_optimizations.run_results_execution_id AS t9_r2,
    run_results_parameter_optimizations.data_config_id AS t9_r3,
    run_results_parameter_optimizations.program_config_id AS t9_r4,
    run_results_parameter_optimizations.abs_path AS t9_r5,
    program_configs.id AS t10_r0,
    program_configs.repository_id AS t10_r1,
    program_configs.program_id AS t10_r2,
    program_configs.program_config_id AS t10_r4,
    program_configs.name AS t10_r5,
    program_configs.abs_path AS t10_r6,
    program_configs.invocation_format AS t10_r7,
    program_configs.invocation_format_without_gold_standard AS t10_r8,
    program_configs.invocation_format_parameter_optimization AS t10_r9,
    program_configs.invocation_format_parameter_optimization_without_gold_standard AS t10_r10,
    program_configs.expects_normalized_data_set AS t10_r11,
    run_results_executions.id AS t11_r0,
    run_results_executions.repository_id AS t11_r1,
    run_results_executions.run_result_id AS t11_r2,
    run_results.id AS t12_r0,
    run_results.repository_id AS t12_r1,
    run_results.run_type_id AS t12_r2,
    run_results.unique_run_identifier AS t12_r3,
    run_results.run_id AS t12_r4,
    run_results.date AS t12_r5
   FROM run_results_parameter_optimizations_parameter_set_iterations
     LEFT JOIN run_results_parameter_optimizations_parameter_values ON run_results_parameter_optimizations_parameter_values.run_results_parameter_optimizations_parameter_set_iteration_id = run_results_parameter_optimizations_parameter_set_iterations.id
     LEFT JOIN run_results_parameter_optimizations_parameter_set_parameters ON run_results_parameter_optimizations_parameter_set_parameters.id = run_results_parameter_optimizations_parameter_values.run_results_parameter_optimizations_parameter_set_parameter_id
     LEFT JOIN program_parameters ON program_parameters.id = run_results_parameter_optimizations_parameter_set_parameters.program_parameter_id
     LEFT JOIN run_results_parameter_optimizations_qualities ON run_results_parameter_optimizations_qualities.run_results_parameter_optimizations_parameter_set_iteration_id = run_results_parameter_optimizations_parameter_set_iterations.id
     LEFT JOIN clustering_quality_measures ON clustering_quality_measures.id = run_results_parameter_optimizations_qualities.clustering_quality_measure_id
     LEFT JOIN run_results_parameter_optimizations_parameter_sets ON run_results_parameter_optimizations_parameter_sets.id = run_results_parameter_optimizations_parameter_set_iterations.run_results_parameter_optimizations_parameter_set_id
     LEFT JOIN run_results_parameter_optimizations_parameter_set_parameters run_results_parameter_optimizations_parameter_set_parameters_ru ON run_results_parameter_optimizations_parameter_set_parameters_ru.run_results_parameter_optimizations_parameter_set_id = run_results_parameter_optimizations_parameter_sets.id
     LEFT JOIN program_parameters program_parameters_run_results_parameter_optimizations_paramete ON program_parameters_run_results_parameter_optimizations_paramete.id = run_results_parameter_optimizations_parameter_set_parameters_ru.program_parameter_id
     LEFT JOIN run_results_parameter_optimizations ON run_results_parameter_optimizations.id = run_results_parameter_optimizations_parameter_sets.run_results_parameter_optimization_id
     LEFT JOIN program_configs as program_configs_bla ON program_configs_bla.id = run_results_parameter_optimizations.program_config_id
     LEFT JOIN program_configs as program_configs ON program_configs.id = program_configs_bla.program_config_id
     LEFT JOIN run_results_executions ON run_results_executions.id = run_results_parameter_optimizations.run_results_execution_id
     LEFT JOIN run_results ON run_results.id = run_results_executions.run_result_id"
  end

  def down
  end
end
