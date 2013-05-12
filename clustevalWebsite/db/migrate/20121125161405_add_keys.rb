class AddKeys < ActiveRecord::Migration
  def change
    add_foreign_key "cluster_objects", "clusters", :name => "cluster_objects_cluster_id_fk", dependent: :delete
    add_foreign_key "cluster_objects", "repositories", :name => "cluster_objects_repository_id_fk", dependent: :delete
    add_foreign_key "clustering_quality_measures", "repositories", :name => "clustering_quality_measures_repository_id_fk", dependent: :delete
    add_foreign_key "clusterings", "repositories", :name => "clusterings_repository_id_fk", dependent: :delete
    add_foreign_key "clusters", "clusterings", :name => "clusters_clustering_id_fk", dependent: :delete
    add_foreign_key "clusters", "repositories", :name => "clusters_repository_id_fk", dependent: :delete
    add_foreign_key "data_configs", "data_configs", :name => "data_configs_data_config_id_fk", dependent: :delete
    add_foreign_key "data_configs", "dataset_configs", :name => "data_configs_dataset_config_id_fk", dependent: :delete
    add_foreign_key "data_configs", "goldstandard_configs", :name => "data_configs_goldstandard_config_id_fk", dependent: :delete
    add_foreign_key "data_configs", "repositories", :name => "data_configs_repository_id_fk", dependent: :delete
    add_foreign_key "dataset_configs", "dataset_configs", :name => "dataset_configs_dataset_config_id_fk", dependent: :delete
    add_foreign_key "dataset_configs", "datasets", :name => "dataset_configs_dataset_id_fk", dependent: :delete
    add_foreign_key "dataset_configs", "repositories", :name => "dataset_configs_repository_id_fk", dependent: :delete
    add_foreign_key "dataset_formats", "repositories", :name => "dataset_formats_repository_id_fk", dependent: :delete
    add_foreign_key "datasets", "dataset_formats", :name => "datasets_dataset_format_id_fk", dependent: :delete
    add_foreign_key "datasets", "datasets", :name => "datasets_dataset_id_fk", dependent: :delete
    add_foreign_key "datasets", "repositories", :name => "datasets_repository_id_fk", dependent: :delete
    add_foreign_key "goldstandard_configs", "goldstandard_configs", :name => "goldstandard_configs_goldstandard_config_id_fk", dependent: :delete
    add_foreign_key "goldstandard_configs", "goldstandards", :name => "goldstandard_configs_goldstandard_id_fk", dependent: :delete
    add_foreign_key "goldstandard_configs", "repositories", :name => "goldstandard_configs_repository_id_fk", dependent: :delete
    add_foreign_key "goldstandards", "goldstandards", :name => "goldstandards_goldstandard_id_fk", dependent: :delete
    add_foreign_key "goldstandards", "repositories", :name => "goldstandards_repository_id_fk", dependent: :delete
    add_foreign_key "optimizable_program_parameters", "program_configs", :name => "optimizable_program_parameters_program_config_id_fk", dependent: :delete
    add_foreign_key "optimizable_program_parameters", "program_parameters", :name => "optimizable_program_parameters_program_parameter_id_fk", dependent: :delete
    add_foreign_key "optimizable_program_parameters", "repositories", :name => "optimizable_program_parameters_repository_id_fk", dependent: :delete
    add_foreign_key "parameter_optimization_methods", "repositories", :name => "parameter_optimization_methods_repository_id_fk", dependent: :delete
    add_foreign_key "program_configs_compatible_dataset_formats", "dataset_formats", :name => "program_configs_compatible_dataset_formats_dataset_format_id_fk", dependent: :delete
    add_foreign_key "program_configs_compatible_dataset_formats", "program_configs", :name => "program_configs_compatible_dataset_formats_program_config_id_fk", dependent: :delete
    add_foreign_key "program_configs_compatible_dataset_formats", "repositories", :name => "program_configs_compatible_dataset_formats_repository_id_fk", dependent: :delete
    add_foreign_key "program_configs", "program_configs", :name => "program_configs_program_config_id_fk", dependent: :delete
    add_foreign_key "program_configs", "programs", :name => "program_configs_program_id_fk", dependent: :delete
    add_foreign_key "program_configs", "repositories", :name => "program_configs_repository_id_fk", dependent: :delete
    add_foreign_key "program_configs", "run_result_formats", :name => "program_configs_run_result_format_id_fk", dependent: :delete
    add_foreign_key "program_parameters", "program_configs", :name => "program_parameters_program_config_id_fk", dependent: :delete
    add_foreign_key "program_parameters", "program_parameter_types", :name => "program_parameters_program_parameter_type_id_fk", dependent: :delete
    add_foreign_key "program_parameters", "repositories", :name => "program_parameters_repository_id_fk", dependent: :delete
    add_foreign_key "programs", "repositories", :name => "programs_repository_id_fk", dependent: :delete
    add_foreign_key "repositories", "repositories", :name => "repositories_repository_id_fk", dependent: :delete
    add_foreign_key "repositories", "repository_types", :name => "repositories_repository_type_id_fk", dependent: :delete
    add_foreign_key "run_analyses", "repositories", :name => "run_analyses_repository_id_fk", dependent: :delete
    add_foreign_key "run_analyses", "runs", :name => "run_analyses_run_id_fk", dependent: :delete
    add_foreign_key "run_analysis_statistics", "repositories", :name => "run_analysis_statistics_repository_id_fk", dependent: :delete
    add_foreign_key "run_analysis_statistics", "run_analyses", :name => "run_analysis_statistics_run_analysis_id_fk", :column => "run_analysis_id", dependent: :delete
    add_foreign_key "run_analysis_statistics", "statistics", :name => "run_analysis_statistics_statistic_id_fk", dependent: :delete
    add_foreign_key "run_clusterings", "repositories", :name => "run_clusterings_repository_id_fk", dependent: :delete
    add_foreign_key "run_clusterings", "run_executions", :name => "run_clusterings_run_execution_id_fk", dependent: :delete
    add_foreign_key "run_data_analyses", "repositories", :name => "run_data_analyses_repository_id_fk", dependent: :delete
    add_foreign_key "run_data_analyses", "run_analyses", :name => "run_data_analyses_run_analysis_id_fk", :column => "run_analysis_id", dependent: :delete
    add_foreign_key "run_data_analysis_data_configs", "data_configs", :name => "run_data_analysis_data_configs_data_config_id_fk", dependent: :delete
    add_foreign_key "run_data_analysis_data_configs", "repositories", :name => "run_data_analysis_data_configs_repository_id_fk", dependent: :delete
    add_foreign_key "run_data_analysis_data_configs", "run_data_analyses", :name => "run_data_analysis_data_configs_run_data_analysis_id_fk", :column => "run_data_analysis_id", dependent: :delete
    add_foreign_key "run_execution_data_configs", "data_configs", :name => "run_execution_data_configs_data_config_id_fk", dependent: :delete
    add_foreign_key "run_execution_data_configs", "repositories", :name => "run_execution_data_configs_repository_id_fk", dependent: :delete
    add_foreign_key "run_execution_data_configs", "run_executions", :name => "run_execution_data_configs_run_execution_id_fk", dependent: :delete
    add_foreign_key "run_execution_parameter_values", "program_configs", :name => "run_execution_parameter_values_program_config_id_fk", dependent: :delete
    add_foreign_key "run_execution_parameter_values", "program_parameters", :name => "run_execution_parameter_values_program_parameter_id_fk", dependent: :delete
    add_foreign_key "run_execution_parameter_values", "repositories", :name => "run_execution_parameter_values_repository_id_fk", dependent: :delete
    add_foreign_key "run_execution_parameter_values", "run_executions", :name => "run_execution_parameter_values_run_execution_id_fk", dependent: :delete
    add_foreign_key "run_execution_program_configs", "program_configs", :name => "run_execution_program_configs_program_config_id_fk", dependent: :delete
    add_foreign_key "run_execution_program_configs", "repositories", :name => "run_execution_program_configs_repository_id_fk", dependent: :delete
    add_foreign_key "run_execution_program_configs", "run_executions", :name => "run_execution_program_configs_run_execution_id_fk", dependent: :delete
    add_foreign_key "run_execution_quality_measures", "clustering_quality_measures", :name => "run_execution_quality_measures_clustering_quality_measure_id_fk", dependent: :delete
    add_foreign_key "run_execution_quality_measures", "repositories", :name => "run_execution_quality_measures_repository_id_fk", dependent: :delete
    add_foreign_key "run_execution_quality_measures", "run_executions", :name => "run_execution_quality_measures_run_execution_id_fk", dependent: :delete
    add_foreign_key "run_executions", "repositories", :name => "run_executions_repository_id_fk", dependent: :delete
    add_foreign_key "run_executions", "runs", :name => "run_executions_run_id_fk", dependent: :delete
    add_foreign_key "run_internal_parameter_optimizations", "repositories", :name => "run_internal_parameter_optimizations_repository_id_fk", dependent: :delete
    add_foreign_key "run_internal_parameter_optimizations", "run_executions", :name => "run_internal_parameter_optimizations_run_execution_id_fk", dependent: :delete
    add_foreign_key "run_parameter_optimization_methods", "clustering_quality_measures", :name => "run_param_opt_methods_clustering_quality_measure_id_fk", dependent: :delete
    add_foreign_key "run_parameter_optimization_methods", "parameter_optimization_methods", :name => "run_param_opt_methods_parameter_optimization_method_id_fk", dependent: :delete
    add_foreign_key "run_parameter_optimization_methods", "program_configs", :name => "run_parameter_optimization_methods_program_config_id_fk", dependent: :delete
    add_foreign_key "run_parameter_optimization_methods", "repositories", :name => "run_parameter_optimization_methods_repository_id_fk", dependent: :delete
    add_foreign_key "run_parameter_optimization_methods", "run_parameter_optimizations", :name => "run_param_opt_methods_run_parameter_optimization_id_fk", dependent: :delete
    add_foreign_key "run_parameter_optimization_parameters", "program_configs", :name => "run_param_opt_parameters_program_config_id_fk", dependent: :delete
    add_foreign_key "run_parameter_optimization_parameters", "program_parameters", :name => "run_param_opt_parameters_program_parameter_id_fk", dependent: :delete
    add_foreign_key "run_parameter_optimization_parameters", "repositories", :name => "run_param_opt_parameters_repository_id_fk", dependent: :delete
    add_foreign_key "run_parameter_optimization_parameters", "run_parameter_optimizations", :name => "run_param_opt_parameters_run_parameter_optimization_id_fk", dependent: :delete
    add_foreign_key "run_parameter_optimization_quality_measures", "clustering_quality_measures", :name => "run_param_opt_quality_measures_clustering_quality_measure_id_fk", dependent: :delete
    add_foreign_key "run_parameter_optimization_quality_measures", "repositories", :name => "run_param_opt_quality_measures_repository_id_fk", dependent: :delete
    add_foreign_key "run_parameter_optimization_quality_measures", "run_parameter_optimizations", :name => "run_param_opt_quality_measures_run_parameter_optimization_id_fk", dependent: :delete
    add_foreign_key "run_parameter_optimizations", "repositories", :name => "run_parameter_optimizations_repository_id_fk", dependent: :delete
    add_foreign_key "run_parameter_optimizations", "run_executions", :name => "run_parameter_optimizations_run_execution_id_fk", dependent: :delete
    add_foreign_key "run_result_formats", "repositories", :name => "run_result_formats_repository_id_fk", dependent: :delete
    add_foreign_key "run_results_analyses", "repositories", :name => "run_results_analyses_repository_id_fk", dependent: :delete
    add_foreign_key "run_results_analyses", "run_results", :name => "run_results_analyses_run_result_id_fk", dependent: :delete
    add_foreign_key "run_results_clusterings", "repositories", :name => "run_results_clusterings_repository_id_fk", dependent: :delete
    add_foreign_key "run_results_clusterings", "run_results_executions", :name => "run_results_clusterings_run_results_execution_id_fk", dependent: :delete
    add_foreign_key "run_results_data_analyses", "repositories", :name => "run_results_data_analyses_repository_id_fk", dependent: :delete
    add_foreign_key "run_results_data_analyses", "run_results_analyses", :name => "run_results_data_analyses_run_results_analysis_id_fk", :column => "run_results_analysis_id", dependent: :delete
    add_foreign_key "run_results_executions", "repositories", :name => "run_results_executions_repository_id_fk", dependent: :delete
    add_foreign_key "run_results_executions", "run_results", :name => "run_results_executions_run_result_id_fk", dependent: :delete
    add_foreign_key "run_results_internal_parameter_optimizations", "run_results_executions", :name => "run_results_internal_param_opt_run_results_execution_id_fk", dependent: :delete
    add_foreign_key "run_results_parameter_optimizations", "data_configs", :name => "run_results_parameter_optimizations_data_config_id_fk", dependent: :delete
    add_foreign_key "run_results_parameter_optimizations_parameter_set_iterations", "repositories", :name => "run_results_param_opt_param_set_iter_repository_id_fk", dependent: :delete
    add_foreign_key "run_results_parameter_optimizations_parameter_set_iterations", "clusterings", :name => "run_results_param_opt_parameter_set_iterations_clustering_id_fk", dependent: :delete
    add_foreign_key "run_results_parameter_optimizations_parameter_set_iterations", "run_results_parameter_optimizations_parameter_sets", :name => "fk11", dependent: :delete
    add_foreign_key "run_results_parameter_optimizations_parameter_set_parameters", "program_parameters", :name => "run_results_param_opt_parameter_set_param_program_param_id_fk", dependent: :delete
    add_foreign_key "run_results_parameter_optimizations_parameter_set_parameters", "repositories", :name => "run_results_param_opt_param_set_param_repository_id_fk", dependent: :delete
    add_foreign_key "run_results_parameter_optimizations_parameter_set_parameters", "run_results_parameter_optimizations", :name => "fk12", dependent: :delete
    add_foreign_key "run_results_parameter_optimizations_parameter_set_parameters", "run_results_parameter_optimizations_parameter_sets", :name => "fk13", dependent: :delete
    add_foreign_key "run_results_parameter_optimizations_parameter_sets", "repositories", :name => "fk14", dependent: :delete
    add_foreign_key "run_results_parameter_optimizations_parameter_sets", "run_results_parameter_optimizations", :name => "fk15", dependent: :delete
    add_foreign_key "run_results_parameter_optimizations_parameter_values", "repositories", :name => "fk16", dependent: :delete
    add_foreign_key "run_results_parameter_optimizations_parameter_values", "run_results_parameter_optimizations", :name => "fk17", dependent: :delete
    add_foreign_key "run_results_parameter_optimizations_parameter_values", "run_results_parameter_optimizations_parameter_set_iterations", :name => "fk18", dependent: :delete
    add_foreign_key "run_results_parameter_optimizations_parameter_values", "run_results_parameter_optimizations_parameter_set_parameters", :name => "fk19", dependent: :delete
    add_foreign_key "run_results_parameter_optimizations", "program_configs", :name => "run_results_parameter_optimizations_program_config_id_fk", dependent: :delete
    add_foreign_key "run_results_parameter_optimizations_qualities", "clustering_quality_measures", :name => "fk20", dependent: :delete
    add_foreign_key "run_results_parameter_optimizations_qualities", "repositories", :name => "fk21", dependent: :delete
    add_foreign_key "run_results_parameter_optimizations_qualities", "run_results_parameter_optimizations", :name => "fk22", dependent: :delete
    add_foreign_key "run_results_parameter_optimizations_qualities", "run_results_parameter_optimizations_parameter_set_iterations", :name => "fk23", dependent: :delete
    add_foreign_key "run_results_parameter_optimizations", "repositories", :name => "run_results_parameter_optimizations_repository_id_fk", dependent: :delete
    add_foreign_key "run_results_parameter_optimizations", "run_results_executions", :name => "run_results_parameter_optimizations_run_results_execution_id_fk", dependent: :delete
    add_foreign_key "run_results", "repositories", :name => "run_results_repository_id_fk", dependent: :delete
    add_foreign_key "run_results_run_analyses", "repositories", :name => "run_results_run_analyses_repository_id_fk", dependent: :delete
    add_foreign_key "run_results_run_analyses", "run_results_analyses", :name => "run_results_run_analyses_run_results_analysis_id_fk", :column => "run_results_analysis_id", dependent: :delete
    add_foreign_key "run_results_run_data_analyses", "repositories", :name => "run_results_run_data_analyses_repository_id_fk", dependent: :delete
    add_foreign_key "run_results_run_data_analyses", "run_results_analyses", :name => "run_results_run_data_analyses_run_results_run_analysis_id_fk", :column => "run_results_analysis_id", dependent: :delete
    add_foreign_key "run_results", "runs", :name => "run_results_run_id_fk", dependent: :delete
    add_foreign_key "run_results", "run_types", :name => "run_results_run_type_id_fk", dependent: :delete
    add_foreign_key "run_run_analyses", "repositories", :name => "run_run_analyses_repository_id_fk", dependent: :delete
    add_foreign_key "run_run_analyses", "run_analyses", :name => "run_run_analyses_run_analysis_id_fk", :column => "run_analysis_id", dependent: :delete
    add_foreign_key "run_run_analysis_run_identifiers", "repositories", :name => "run_run_analysis_run_identifiers_repository_id_fk", dependent: :delete
    add_foreign_key "run_run_analysis_run_identifiers", "run_run_analyses", :name => "run_run_analysis_run_identifiers_run_run_analysis_id_fk", :column => "run_run_analysis_id", dependent: :delete
    add_foreign_key "run_run_data_analyses", "repositories", :name => "run_run_data_analyses_repository_id_fk", dependent: :delete
    add_foreign_key "run_run_data_analyses", "run_analyses", :name => "run_run_data_analyses_run_run_analysis_id_fk", :column => "run_analysis_id", dependent: :delete
    add_foreign_key "run_run_data_analysis_data_identifiers", "repositories", :name => "run_run_data_analysis_data_identifiers_repository_id_fk", dependent: :delete
    add_foreign_key "run_run_data_analysis_data_identifiers", "run_run_data_analyses", :name => "fk24", :column => "run_run_data_analysis_id", dependent: :delete
    add_foreign_key "runs", "repositories", :name => "runs_repository_id_fk", dependent: :delete
    add_foreign_key "runs", "runs", :name => "runs_run_id_fk", dependent: :delete
    add_foreign_key "runs", "run_types", :name => "runs_run_type_id_fk", dependent: :delete
    add_foreign_key "statistics_datas", "repositories", :name => "statistics_data_repository_id_fk", dependent: :delete
    add_foreign_key "statistics_datas", "statistics", :name => "statistics_data_statistic_id_fk", dependent: :delete
    add_foreign_key "statistics", "repositories", :name => "statistics_repository_id_fk", dependent: :delete
    add_foreign_key "statistics_run_datas", "repositories", :name => "statistics_run_data_repository_id_fk", dependent: :delete
    add_foreign_key "statistics_run_datas", "statistics", :name => "statistics_run_data_statistic_id_fk", dependent: :delete
    add_foreign_key "statistics_runs", "repositories", :name => "statistics_runs_repository_id_fk", dependent: :delete
    add_foreign_key "statistics_runs", "statistics", :name => "statistics_runs_statistic_id_fk", dependent: :delete
  end
end