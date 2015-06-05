# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20150605092817) do

  create_table "aboutus", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "aboutus_impressums", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "admins", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cluster_objects", :force => true do |t|
    t.integer "repository_id", :null => false
    t.integer "cluster_id",    :null => false
    t.binary  "name",          :null => false
  end

  add_index "cluster_objects", ["cluster_id"], :name => "fk_cluster_objects_2"
  add_index "cluster_objects", ["repository_id"], :name => "fk_cluster_objects_1"

  create_table "clustering_quality_measure_optimums", :force => true do |t|
    t.binary "measure_name", :null => false
    t.binary "name",         :null => false
  end

  add_index "clustering_quality_measure_optimums", ["measure_name"], :name => "clustering_quality_measure_optimums_name_UNIQUE", :unique => true

  create_table "clustering_quality_measures", :force => true do |t|
    t.integer "repository_id",          :null => false
    t.binary  "name"
    t.float   "min_value"
    t.float   "max_value"
    t.integer "requires_gold_standard"
    t.binary  "alias"
  end

  add_index "clustering_quality_measures", ["name", "repository_id"], :name => "clustering_quality_measures_name_UNIQUE", :unique => true
  add_index "clustering_quality_measures", ["name"], :name => "name_INDEX"
  add_index "clustering_quality_measures", ["repository_id"], :name => "fk_clusteringQualityMeasures_1"

  create_table "clusterings", :force => true do |t|
    t.integer "repository_id", :null => false
    t.binary  "abs_path",      :null => false
  end

  add_index "clusterings", ["abs_path"], :name => "clusterings_index3", :unique => true
  add_index "clusterings", ["repository_id"], :name => "fk_clusterings_1"

  create_table "clusters", :force => true do |t|
    t.integer "repository_id", :null => false
    t.integer "clustering_id", :null => false
    t.binary  "name",          :null => false
  end

  add_index "clusters", ["clustering_id"], :name => "fk_clusters_2"
  add_index "clusters", ["repository_id"], :name => "fk_clusters_1"

  create_table "data_configs", :force => true do |t|
    t.integer "repository_id",          :null => false
    t.binary  "abs_path"
    t.binary  "name"
    t.integer "dataset_config_id",      :null => false
    t.integer "goldstandard_config_id"
    t.integer "data_config_id"
  end

  add_index "data_configs", ["abs_path", "repository_id"], :name => "data_configs_abs_path_UNIQUE", :unique => true
  add_index "data_configs", ["data_config_id"], :name => "fk_data_configs_1"
  add_index "data_configs", ["dataset_config_id"], :name => "fk_dataConfigs_1"
  add_index "data_configs", ["goldstandard_config_id"], :name => "fk_dataConfigs_2"
  add_index "data_configs", ["repository_id"], :name => "fk_dataConfigs_3"

  create_table "dataset_configs", :force => true do |t|
    t.integer "repository_id",     :null => false
    t.binary  "abs_path"
    t.binary  "name"
    t.integer "dataset_id",        :null => false
    t.integer "dataset_config_id"
  end

  add_index "dataset_configs", ["abs_path", "repository_id"], :name => "dataset_configs_abs_path_UNIQUE", :unique => true
  add_index "dataset_configs", ["dataset_config_id"], :name => "fk_dataset_configs_1"
  add_index "dataset_configs", ["dataset_id"], :name => "fk_dataSetConfigs_2"
  add_index "dataset_configs", ["repository_id"], :name => "fk_dataSetConfigs_1"

  create_table "dataset_descriptions", :force => true do |t|
    t.binary "dataset_fullName",    :null => false
    t.binary "dataset_description", :null => false
  end

  add_index "dataset_descriptions", ["dataset_fullName"], :name => "fk_dataset_descriptions_1", :unique => true

  create_table "dataset_formats", :force => true do |t|
    t.integer "repository_id", :null => false
    t.binary  "name"
    t.binary  "alias",         :null => false
  end

  add_index "dataset_formats", ["name", "repository_id"], :name => "dataset_formats_name_UNIQUE", :unique => true
  add_index "dataset_formats", ["repository_id"], :name => "fk_dataSetFormats_1"

  create_table "dataset_images", :force => true do |t|
    t.binary "dataset_fullName", :null => false
    t.binary "dataset_imageUrl", :null => false
  end

  add_index "dataset_images", ["dataset_fullName"], :name => "fk_dataset_images_1", :unique => true

  create_table "dataset_publications", :force => true do |t|
    t.binary "dataset_fullName",       :null => false
    t.binary "dataset_publication",    :null => false
    t.binary "dataset_publicationUrl", :null => false
  end

  add_index "dataset_publications", ["dataset_fullName"], :name => "fk_dataset_publications_1", :unique => true

  create_table "dataset_types", :force => true do |t|
    t.integer "repository_id", :null => false
    t.binary  "name",          :null => false
    t.binary  "alias",         :null => false
  end

  add_index "dataset_types", ["repository_id", "name"], :name => "index_dataset_types_name", :unique => true
  add_index "dataset_types", ["repository_id"], :name => "fk_dataset_types_1"

  create_table "dataset_visibilities", :force => true do |t|
    t.string   "dataset_name"
    t.boolean  "visible"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "datasets", :force => true do |t|
    t.integer "repository_id",     :null => false
    t.binary  "abs_path",          :null => false
    t.integer "dataset_format_id", :null => false
    t.integer "dataset_id"
    t.integer "checksum",          :null => false
    t.integer "dataset_type_id",   :null => false
    t.string  "alias",             :null => false
    t.integer "visibility"
  end

  add_index "datasets", ["abs_path", "repository_id"], :name => "datasets_abs_path_UNIQUE", :unique => true
  add_index "datasets", ["dataset_format_id"], :name => "fk_datasets_1"
  add_index "datasets", ["dataset_id"], :name => "fk_datasets_3"
  add_index "datasets", ["dataset_type_id"], :name => "fk_datasets_4"
  add_index "datasets", ["repository_id"], :name => "fk_datasets_2"

  create_table "goldstandard_configs", :force => true do |t|
    t.integer "repository_id",          :null => false
    t.binary  "abs_path"
    t.binary  "name"
    t.integer "goldstandard_id",        :null => false
    t.integer "goldstandard_config_id"
  end

  add_index "goldstandard_configs", ["abs_path", "repository_id"], :name => "goldstandard_configs_abs_path_UNIQUE", :unique => true
  add_index "goldstandard_configs", ["goldstandard_config_id"], :name => "fk_goldstandard_configs_1"
  add_index "goldstandard_configs", ["goldstandard_id"], :name => "fk_goldStandardConfigs_2"
  add_index "goldstandard_configs", ["repository_id"], :name => "fk_goldStandardConfigs_1"

  create_table "goldstandards", :force => true do |t|
    t.integer "repository_id",   :null => false
    t.binary  "abs_path",        :null => false
    t.integer "goldstandard_id"
  end

  add_index "goldstandards", ["abs_path", "repository_id"], :name => "goldstandards_abs_path_UNIQUE", :unique => true
  add_index "goldstandards", ["goldstandard_id"], :name => "fk_goldstandards_2"
  add_index "goldstandards", ["repository_id"], :name => "fk_goldstandards_1"

  create_table "help_installations", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "help_publications", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "help_source_codes", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "help_technical_documentations", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "helps", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "impressions", :force => true do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], :name => "controlleraction_ip_index"
  add_index "impressions", ["controller_name", "action_name", "request_hash"], :name => "controlleraction_request_index"
  add_index "impressions", ["controller_name", "action_name", "session_hash"], :name => "controlleraction_session_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], :name => "poly_ip_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], :name => "poly_request_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], :name => "poly_session_index"
  add_index "impressions", ["user_id"], :name => "index_impressions_on_user_id"

  create_table "mains", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "optimizable_program_parameters", :force => true do |t|
    t.integer "repository_id",        :null => false
    t.integer "program_config_id",    :null => false
    t.integer "program_parameter_id", :null => false
  end

  add_index "optimizable_program_parameters", ["program_config_id", "program_parameter_id", "repository_id"], :name => "optimizable_program_parameters_index5", :unique => true
  add_index "optimizable_program_parameters", ["program_config_id"], :name => "fk_optimizableProgramParameter_3"
  add_index "optimizable_program_parameters", ["program_parameter_id"], :name => "fk_optimizableProgramParameter_1"
  add_index "optimizable_program_parameters", ["repository_id"], :name => "fk_optimizableProgramParameter_2"

  create_table "parameter_optimization_methods", :force => true do |t|
    t.integer "repository_id", :null => false
    t.binary  "name",          :null => false
  end

  add_index "parameter_optimization_methods", ["name", "repository_id"], :name => "parameter_optimization_methods_name_UNIQUE", :unique => true
  add_index "parameter_optimization_methods", ["repository_id"], :name => "fk_parameterOptimizationMethods_1"

  create_table "program_configs", :force => true do |t|
    t.integer "repository_id",                                                  :null => false
    t.integer "program_id",                                                     :null => false
    t.integer "run_result_format_id",                                           :null => false
    t.integer "program_config_id"
    t.binary  "name",                                                           :null => false
    t.binary  "abs_path",                                                       :null => false
    t.binary  "invocation_format"
    t.binary  "invocation_format_without_gold_standard"
    t.binary  "invocation_format_parameter_optimization"
    t.binary  "invocation_format_parameter_optimization_without_gold_standard"
    t.integer "expects_normalized_data_set"
  end

  add_index "program_configs", ["abs_path", "repository_id"], :name => "program_configs_abs_path_UNIQUE", :unique => true
  add_index "program_configs", ["program_config_id"], :name => "fk_program_configs_3"
  add_index "program_configs", ["program_id"], :name => "fk_programConfigs_1"
  add_index "program_configs", ["program_id"], :name => "fk_program_configs_2"
  add_index "program_configs", ["repository_id"], :name => "fk_programConfigs_2"
  add_index "program_configs", ["run_result_format_id"], :name => "fk_program_configs_4"

  create_table "program_configs_compatible_dataset_formats", :force => true do |t|
    t.integer "repository_id",     :null => false
    t.integer "program_config_id", :null => false
    t.integer "dataset_format_id", :null => false
  end

  add_index "program_configs_compatible_dataset_formats", ["dataset_format_id"], :name => "fk_program_configs_compatible_dataset_formats_3"
  add_index "program_configs_compatible_dataset_formats", ["dataset_format_id"], :name => "fk_programsCompatibleDataSetFormats_2"
  add_index "program_configs_compatible_dataset_formats", ["program_config_id"], :name => "fk_program_configs_compatible_dataset_formats_2"
  add_index "program_configs_compatible_dataset_formats", ["program_config_id"], :name => "fk_programsCompatibleDataSetFormats_1"
  add_index "program_configs_compatible_dataset_formats", ["repository_id", "program_config_id", "dataset_format_id"], :name => "program_configs_compatible_dataset_formats_index5", :unique => true
  add_index "program_configs_compatible_dataset_formats", ["repository_id"], :name => "fk_program_configs_compatible_dataset_formats_1"
  add_index "program_configs_compatible_dataset_formats", ["repository_id"], :name => "fk_programs_compatible_dataset_formats_1"

  create_table "program_descriptions", :force => true do |t|
    t.binary "program_fullName",    :null => false
    t.binary "program_description", :null => false
  end

  add_index "program_descriptions", ["program_fullName"], :name => "fk_program_descriptions_1", :unique => true

  create_table "program_images", :force => true do |t|
    t.binary "program_fullName", :null => false
    t.binary "program_imageUrl", :null => false
  end

  add_index "program_images", ["program_fullName"], :name => "fk_program_images_1", :unique => true

  create_table "program_parameter_types", :force => true do |t|
    t.binary "name", :null => false
  end

  add_index "program_parameter_types", ["name"], :name => "program_parameter_types_index3", :unique => true

  create_table "program_parameters", :force => true do |t|
    t.integer "repository_id",             :null => false
    t.integer "program_config_id",         :null => false
    t.integer "program_parameter_type_id", :null => false
    t.binary  "name",                      :null => false
    t.binary  "description"
    t.binary  "min_value"
    t.binary  "max_value"
    t.binary  "def"
  end

  add_index "program_parameters", ["program_config_id", "name", "repository_id"], :name => "program_parameters_index3", :unique => true
  add_index "program_parameters", ["program_config_id"], :name => "fk_programParameter_1"
  add_index "program_parameters", ["program_config_id"], :name => "fk_program_parameter_1"
  add_index "program_parameters", ["program_parameter_type_id"], :name => "fk_program_parameters_1"
  add_index "program_parameters", ["repository_id"], :name => "fk_programParameter_2"

  create_table "program_publications", :force => true do |t|
    t.binary "program_fullName",       :null => false
    t.binary "program_publication",    :null => false
    t.binary "program_publicationUrl", :null => false
  end

  add_index "program_publications", ["program_fullName"], :name => "fk_program_publications_1", :unique => true

  create_table "programs", :force => true do |t|
    t.integer "repository_id", :null => false
    t.binary  "abs_path",      :null => false
    t.binary  "alias",         :null => false
  end

  add_index "programs", ["abs_path", "repository_id"], :name => "programs_name_UNIQUE", :unique => true
  add_index "programs", ["repository_id"], :name => "fk_programs_3"

  create_table "repositories", :force => true do |t|
    t.binary  "base_path",          :null => false
    t.integer "repository_id"
    t.integer "repository_type_id", :null => false
  end

  add_index "repositories", ["base_path"], :name => "repositories_index2", :unique => true
  add_index "repositories", ["repository_id"], :name => "fk_repositories_3"
  add_index "repositories", ["repository_type_id"], :name => "fk_repositories_1"

  create_table "repository_types", :force => true do |t|
    t.binary "name"
  end

  add_index "repository_types", ["name"], :name => "repository_types_name_UNIQUE", :unique => true

  create_table "run_analyses", :force => true do |t|
    t.integer "repository_id", :null => false
    t.integer "run_id",        :null => false
  end

  add_index "run_analyses", ["repository_id", "run_id"], :name => "run_analyses_index4", :unique => true
  add_index "run_analyses", ["repository_id"], :name => "fk_runConfigsAnalysis_1"
  add_index "run_analyses", ["run_id"], :name => "fk_runConfigsAnalysis_2"

  create_table "run_analysis_statistics", :force => true do |t|
    t.integer "repository_id",   :null => false
    t.integer "run_analysis_id", :null => false
    t.integer "statistic_id",    :null => false
  end

  add_index "run_analysis_statistics", ["repository_id", "run_analysis_id", "statistic_id"], :name => "run_analysis_statistics_index5", :unique => true
  add_index "run_analysis_statistics", ["repository_id"], :name => "fk_runConfigsAnalysisStatistics_1"
  add_index "run_analysis_statistics", ["run_analysis_id"], :name => "fk_runConfigsAnalysisStatistics_2"
  add_index "run_analysis_statistics", ["statistic_id"], :name => "fk_runConfigsAnalysisStatistics_3"

  create_table "run_clusterings", :force => true do |t|
    t.integer "repository_id",    :null => false
    t.integer "run_execution_id", :null => false
  end

  add_index "run_clusterings", ["repository_id", "run_execution_id"], :name => "run_clusterings_index4", :unique => true
  add_index "run_clusterings", ["repository_id"], :name => "fk_runConfigsClustering_2"
  add_index "run_clusterings", ["run_execution_id"], :name => "fk_runConfigsClustering_1"
  add_index "run_clusterings", ["run_execution_id"], :name => "fk_run_clusterings_1"

  create_table "run_data_analyses", :force => true do |t|
    t.integer "repository_id",   :null => false
    t.integer "run_analysis_id", :null => false
  end

  add_index "run_data_analyses", ["repository_id", "run_analysis_id"], :name => "run_data_analyses_index4", :unique => true
  add_index "run_data_analyses", ["repository_id"], :name => "fk_runConfigsAnalysisData_1"
  add_index "run_data_analyses", ["run_analysis_id"], :name => "fk_runConfigsAnalysisData_2"

  create_table "run_data_analysis_data_configs", :force => true do |t|
    t.integer "repository_id",        :null => false
    t.integer "run_data_analysis_id", :null => false
    t.integer "data_config_id",       :null => false
  end

  add_index "run_data_analysis_data_configs", ["data_config_id"], :name => "fk_runConfigsAnalysisDataDataConfigs_3"
  add_index "run_data_analysis_data_configs", ["repository_id"], :name => "fk_runConfigsAnalysisDataDataConfigs_1"
  add_index "run_data_analysis_data_configs", ["run_data_analysis_id", "data_config_id", "repository_id"], :name => "run_data_analysis_data_configs_index5", :unique => true
  add_index "run_data_analysis_data_configs", ["run_data_analysis_id"], :name => "fk_runConfigsAnalysisDataDataConfigs_2"

  create_table "run_execution_data_configs", :force => true do |t|
    t.integer "repository_id",    :null => false
    t.integer "run_execution_id", :null => false
    t.integer "data_config_id",   :null => false
  end

  add_index "run_execution_data_configs", ["data_config_id"], :name => "fk_runConfigsExecutionDataConfigs_2"
  add_index "run_execution_data_configs", ["repository_id"], :name => "fk_runConfigsExecutionDataConfigs_3"
  add_index "run_execution_data_configs", ["run_execution_id", "data_config_id", "repository_id"], :name => "run_execution_data_configs_index4", :unique => true
  add_index "run_execution_data_configs", ["run_execution_id"], :name => "fk_runConfigsExecutionDataConfigs_1"
  add_index "run_execution_data_configs", ["run_execution_id"], :name => "fk_run_execution_data_configs_1"

  create_table "run_execution_parameter_values", :force => true do |t|
    t.integer "repository_id",        :null => false
    t.integer "run_execution_id",     :null => false
    t.integer "program_config_id",    :null => false
    t.integer "program_parameter_id", :null => false
    t.binary  "value"
  end

  add_index "run_execution_parameter_values", ["program_config_id"], :name => "fk_runConfigsExecutionParameterValues_2"
  add_index "run_execution_parameter_values", ["program_parameter_id"], :name => "fk_runConfigsExecutionParameterValues_3"
  add_index "run_execution_parameter_values", ["repository_id", "run_execution_id", "program_config_id", "program_parameter_id"], :name => "run_execution_parameter_values_index6", :unique => true
  add_index "run_execution_parameter_values", ["repository_id"], :name => "fk_runConfigsExecutionParameterValues_1"
  add_index "run_execution_parameter_values", ["run_execution_id"], :name => "fk_runConfigsExecutionParameterValues_4"

  create_table "run_execution_program_configs", :force => true do |t|
    t.integer "repository_id",     :null => false
    t.integer "run_execution_id",  :null => false
    t.integer "program_config_id", :null => false
  end

  add_index "run_execution_program_configs", ["program_config_id"], :name => "fk_runConfigsExecutionProgramConfigs_2"
  add_index "run_execution_program_configs", ["repository_id"], :name => "fk_runConfigsExecutionProgramConfigs_3"
  add_index "run_execution_program_configs", ["run_execution_id", "program_config_id", "repository_id"], :name => "run_execution_program_configs_index4", :unique => true
  add_index "run_execution_program_configs", ["run_execution_id"], :name => "fk_runConfigsExecutionProgramConfigs_1"
  add_index "run_execution_program_configs", ["run_execution_id"], :name => "fk_run_execution_program_configs_1"

  create_table "run_execution_quality_measures", :force => true do |t|
    t.integer "repository_id",                 :null => false
    t.integer "run_execution_id",              :null => false
    t.integer "clustering_quality_measure_id", :null => false
  end

  add_index "run_execution_quality_measures", ["clustering_quality_measure_id"], :name => "fk_runConfigsExecutionQualityMeasures_2"
  add_index "run_execution_quality_measures", ["repository_id", "run_execution_id", "clustering_quality_measure_id"], :name => "run_execution_quality_measures_index5", :unique => true
  add_index "run_execution_quality_measures", ["repository_id"], :name => "fk_runConfigsExecutionQualityMeasures_1"
  add_index "run_execution_quality_measures", ["run_execution_id"], :name => "fk_run_execution_quality_measures_1"
  add_index "run_execution_quality_measures", ["run_execution_id"], :name => "fk_runs_execution_quality_measures_1"

  create_table "run_executions", :force => true do |t|
    t.integer "repository_id", :null => false
    t.integer "run_id",        :null => false
  end

  add_index "run_executions", ["repository_id"], :name => "fk_runConfigsExecution_2"
  add_index "run_executions", ["run_id", "repository_id"], :name => "run_executions_run_id_UNIQUE", :unique => true
  add_index "run_executions", ["run_id"], :name => "fk_runConfigsExecution_1"

  create_table "run_internal_parameter_optimizations", :force => true do |t|
    t.integer "repository_id",    :null => false
    t.integer "run_execution_id", :null => false
  end

  add_index "run_internal_parameter_optimizations", ["repository_id", "run_execution_id"], :name => "run_internal_parameter_optimizations_index4", :unique => true
  add_index "run_internal_parameter_optimizations", ["repository_id"], :name => "fk_runConfigsInternalParameterOptimization_1"
  add_index "run_internal_parameter_optimizations", ["run_execution_id"], :name => "fk_runConfigsInternalParameterOptimization_2"

  create_table "run_parameter_optimization_methods", :force => true do |t|
    t.integer "repository_id",                    :null => false
    t.integer "run_parameter_optimization_id",    :null => false
    t.integer "program_config_id",                :null => false
    t.integer "parameter_optimization_method_id", :null => false
    t.integer "clustering_quality_measure_id",    :null => false
  end

  add_index "run_parameter_optimization_methods", ["clustering_quality_measure_id"], :name => "fk_runConfigsParameterOptimizationMethods_3"
  add_index "run_parameter_optimization_methods", ["parameter_optimization_method_id"], :name => "fk_runConfigsParameterOptimizationMethods_1"
  add_index "run_parameter_optimization_methods", ["program_config_id"], :name => "fk_runConfigsParameterOptimizationMethods_5"
  add_index "run_parameter_optimization_methods", ["repository_id", "run_parameter_optimization_id", "program_config_id", "parameter_optimization_method_id", "clustering_quality_measure_id"], :name => "run_parameter_optimization_methods_index7", :unique => true
  add_index "run_parameter_optimization_methods", ["repository_id"], :name => "fk_runConfigsParameterOptimizationMethods_4"
  add_index "run_parameter_optimization_methods", ["run_parameter_optimization_id"], :name => "fk_runConfigsParameterOptimizationMethods_2"

  create_table "run_parameter_optimization_parameters", :force => true do |t|
    t.integer "repository_id",                 :null => false
    t.integer "run_parameter_optimization_id", :null => false
    t.integer "program_config_id",             :null => false
    t.integer "program_parameter_id",          :null => false
  end

  add_index "run_parameter_optimization_parameters", ["program_config_id"], :name => "fk_runConfigsParameterOptimizationParameters_1"
  add_index "run_parameter_optimization_parameters", ["program_parameter_id"], :name => "fk_runConfigParameterOptimizationParameters_3"
  add_index "run_parameter_optimization_parameters", ["repository_id", "run_parameter_optimization_id", "program_config_id", "program_parameter_id"], :name => "run_parameter_optimization_parameters_index6", :unique => true
  add_index "run_parameter_optimization_parameters", ["repository_id"], :name => "fk_runConfigParameterOptimizationParameters_1"
  add_index "run_parameter_optimization_parameters", ["run_parameter_optimization_id"], :name => "fk_runConfigParameterOptimizationParameters_2"

  create_table "run_parameter_optimization_quality_measures", :force => true do |t|
    t.integer "repository_id",                 :null => false
    t.integer "run_parameter_optimization_id", :null => false
    t.integer "clustering_quality_measure_id", :null => false
  end

  add_index "run_parameter_optimization_quality_measures", ["clustering_quality_measure_id"], :name => "fk_runs_parameter_optimization_quality_measures_3"
  add_index "run_parameter_optimization_quality_measures", ["repository_id", "run_parameter_optimization_id", "clustering_quality_measure_id"], :name => "run_parameter_optimization_quality_measures_index2", :unique => true
  add_index "run_parameter_optimization_quality_measures", ["repository_id"], :name => "fk_runs_parameter_optimization_quality_measures_1"
  add_index "run_parameter_optimization_quality_measures", ["run_parameter_optimization_id"], :name => "fk_runs_parameter_optimization_quality_measures_2"

  create_table "run_parameter_optimizations", :force => true do |t|
    t.integer "repository_id",    :null => false
    t.integer "run_execution_id", :null => false
  end

  add_index "run_parameter_optimizations", ["repository_id", "run_execution_id"], :name => "run_parameter_optimizations_index4", :unique => true
  add_index "run_parameter_optimizations", ["repository_id"], :name => "fk_runConfigsParameterOptimization_2"
  add_index "run_parameter_optimizations", ["run_execution_id"], :name => "fk_runConfigsParameterOptimization_1"

  create_table "run_result_formats", :force => true do |t|
    t.integer "repository_id", :null => false
    t.binary  "name",          :null => false
  end

  add_index "run_result_formats", ["name", "repository_id"], :name => "run_result_formats_index2", :unique => true
  add_index "run_result_formats", ["repository_id"], :name => "fk_runResultFormats_1"

  create_table "run_results", :force => true do |t|
    t.integer  "repository_id",         :null => false
    t.integer  "run_type_id",           :null => false
    t.binary   "abs_path",              :null => false
    t.binary   "unique_run_identifier", :null => false
    t.integer  "run_id",                :null => false
    t.datetime "date",                  :null => false
  end

  add_index "run_results", ["repository_id", "unique_run_identifier"], :name => "run_results_index3", :unique => true
  add_index "run_results", ["repository_id"], :name => "fk_runResults_1"
  add_index "run_results", ["repository_id"], :name => "fk_run_results_1"
  add_index "run_results", ["run_id"], :name => "fk_run_results_3"
  add_index "run_results", ["run_type_id"], :name => "fk_run_results_2"

  create_table "run_results_analyses", :force => true do |t|
    t.integer "repository_id", :null => false
    t.integer "run_result_id", :null => false
  end

  add_index "run_results_analyses", ["repository_id", "run_result_id"], :name => "run_results_analyses_index4", :unique => true
  add_index "run_results_analyses", ["repository_id"], :name => "fk_run_results_analyses_1"
  add_index "run_results_analyses", ["run_result_id"], :name => "fk_run_results_analyses_2"

  create_table "run_results_clustering_qualities", :force => true do |t|
    t.integer "repository_id",                 :null => false
    t.integer "run_results_clustering_id",     :null => false
    t.integer "data_config_id",                :null => false
    t.integer "program_config_id",             :null => false
    t.integer "clustering_quality_measure_id", :null => false
    t.binary  "param_string",                  :null => false
    t.binary  "quality",                       :null => false
  end

  add_index "run_results_clustering_qualities", ["repository_id", "run_results_clustering_id", "data_config_id", "program_config_id", "clustering_quality_measure_id"], :name => "fk_run_results_clustering_qualities_2", :unique => true
  add_index "run_results_clustering_qualities", ["repository_id"], :name => "fk_run_results_clustering_qualities_1"

  create_table "run_results_clusterings", :force => true do |t|
    t.integer "repository_id",            :null => false
    t.integer "run_results_execution_id", :null => false
    t.binary  "abs_path"
  end

  add_index "run_results_clusterings", ["repository_id", "run_results_execution_id", "abs_path"], :name => "run_results_clusterings_index4", :unique => true
  add_index "run_results_clusterings", ["repository_id"], :name => "fk_run_results_clusterings_1"
  add_index "run_results_clusterings", ["run_results_execution_id"], :name => "fk_run_results_clusterings_2"

  create_table "run_results_data_analyses", :force => true do |t|
    t.integer "repository_id",           :null => false
    t.integer "run_results_analysis_id", :null => false
  end

  add_index "run_results_data_analyses", ["repository_id", "run_results_analysis_id"], :name => "run_results_data_analyses_index4", :unique => true
  add_index "run_results_data_analyses", ["repository_id"], :name => "fk_runResultsDataAnalysis_1"
  add_index "run_results_data_analyses", ["run_results_analysis_id"], :name => "fk_runResultsDataAnalysis_2"

  create_table "run_results_executions", :force => true do |t|
    t.integer "repository_id", :null => false
    t.integer "run_result_id", :null => false
  end

  add_index "run_results_executions", ["repository_id", "run_result_id"], :name => "run_results_executions_index4", :unique => true
  add_index "run_results_executions", ["repository_id"], :name => "fk_runResultExecution_1"
  add_index "run_results_executions", ["run_result_id"], :name => "fk_runResultExecution_2"

  create_table "run_results_internal_parameter_optimizations", :force => true do |t|
    t.integer "repository_id",            :null => false
    t.integer "run_results_execution_id", :null => false
  end

  add_index "run_results_internal_parameter_optimizations", ["repository_id", "run_results_execution_id"], :name => "run_results_internal_parameter_optimizations_index4", :unique => true
  add_index "run_results_internal_parameter_optimizations", ["repository_id"], :name => "fk_runResultsInternalParamOpts_1"

  create_table "run_results_parameter_optimizations", :force => true do |t|
    t.integer "repository_id",            :null => false
    t.integer "run_results_execution_id", :null => false
    t.integer "data_config_id",           :null => false
    t.integer "program_config_id",        :null => false
    t.binary  "abs_path"
  end

  add_index "run_results_parameter_optimizations", ["abs_path"], :name => "index_paramopt_abspath"
  add_index "run_results_parameter_optimizations", ["data_config_id"], :name => "fk_run_results_parameter_optimizations_1"
  add_index "run_results_parameter_optimizations", ["program_config_id"], :name => "fk_run_results_parameter_optimizations_2"
  add_index "run_results_parameter_optimizations", ["repository_id", "run_results_execution_id", "abs_path"], :name => "run_results_parameter_optimizations_index4", :unique => true
  add_index "run_results_parameter_optimizations", ["repository_id"], :name => "fk_runResultParameterOptimization_1"
  add_index "run_results_parameter_optimizations", ["run_results_execution_id"], :name => "fk_runResultParameterOptimization_2"
  add_index "run_results_parameter_optimizations", ["run_results_execution_id"], :name => "fk_run_results_parameter_optimization_1"

  create_table "run_results_parameter_optimizations_parameter_set_iterations", :force => true do |t|
    t.integer "repository_id",                                        :null => false
    t.integer "run_results_parameter_optimizations_parameter_set_id", :null => false
    t.integer "iteration",                                            :null => false
    t.integer "clustering_id"
    t.binary  "param_set_as_string",                                  :null => false
  end

  add_index "run_results_parameter_optimizations_parameter_set_iterations", ["clustering_id"], :name => "fk_2"
  add_index "run_results_parameter_optimizations_parameter_set_iterations", ["iteration", "run_results_parameter_optimizations_parameter_set_id"], :name => "run_results_paramOpts_parameter_set_iterations_index3", :unique => true
  add_index "run_results_parameter_optimizations_parameter_set_iterations", ["run_results_parameter_optimizations_parameter_set_id"], :name => "fk_1"

  create_table "run_results_parameter_optimizations_parameter_set_parameters", :force => true do |t|
    t.integer "repository_id",                                        :null => false
    t.integer "run_results_parameter_optimization_id",                :null => false
    t.integer "run_results_parameter_optimizations_parameter_set_id", :null => false
    t.integer "program_parameter_id",                                 :null => false
  end

  add_index "run_results_parameter_optimizations_parameter_set_parameters", ["program_parameter_id"], :name => "fk_parameter_optimizations_parameter_set_parameters_3"
  add_index "run_results_parameter_optimizations_parameter_set_parameters", ["repository_id", "run_results_parameter_optimization_id", "run_results_parameter_optimizations_parameter_set_id", "program_parameter_id"], :name => "run_results_paramOpts_parameter_set_parameters_index5", :unique => true
  add_index "run_results_parameter_optimizations_parameter_set_parameters", ["repository_id"], :name => "fk_parameter_optimizations_parameter_set_parameters_1"
  add_index "run_results_parameter_optimizations_parameter_set_parameters", ["run_results_parameter_optimizations_parameter_set_id"], :name => "fk_paramOpts_parameter_set_parameters_2"

  create_table "run_results_parameter_optimizations_parameter_sets", :force => true do |t|
    t.integer "repository_id",                         :null => false
    t.integer "run_results_parameter_optimization_id", :null => false
  end

  add_index "run_results_parameter_optimizations_parameter_sets", ["repository_id"], :name => "fk_parameter_sets_1"
  add_index "run_results_parameter_optimizations_parameter_sets", ["repository_id"], :name => "fk_run_results_parameter_optimizations_parameter_sets_2"
  add_index "run_results_parameter_optimizations_parameter_sets", ["run_results_parameter_optimization_id"], :name => "fk_run_results_parameter_optimizations_parameter_sets_1"

  create_table "run_results_parameter_optimizations_parameter_values", :force => true do |t|
    t.integer "repository_id",                                                  :null => false
    t.integer "run_results_parameter_optimization_id",                          :null => false
    t.integer "run_results_parameter_optimizations_parameter_set_iteration_id", :null => false
    t.integer "run_results_parameter_optimizations_parameter_set_parameter_id", :null => false
    t.binary  "value",                                                          :null => false
  end

  add_index "run_results_parameter_optimizations_parameter_values", ["repository_id"], :name => "fk_parameter_set_parameters_3"
  add_index "run_results_parameter_optimizations_parameter_values", ["repository_id"], :name => "fk_parameter_set_values_3"
  add_index "run_results_parameter_optimizations_parameter_values", ["run_results_parameter_optimizations_parameter_set_iteration_id"], :name => "fk_run_results_parameter_optimizations_parameter_values_1"
  add_index "run_results_parameter_optimizations_parameter_values", ["run_results_parameter_optimizations_parameter_set_parameter_id", "run_results_parameter_optimizations_parameter_set_iteration_id", "repository_id"], :name => "run_results_parameter_optimizations_parameter_values_index2", :unique => true
  add_index "run_results_parameter_optimizations_parameter_values", ["run_results_parameter_optimizations_parameter_set_parameter_id"], :name => "fk_parameter_optimizations_parameter_values_1"
  add_index "run_results_parameter_optimizations_parameter_values", ["run_results_parameter_optimizations_parameter_set_parameter_id"], :name => "fk_parameter_set_parameters_2"

  create_table "run_results_parameter_optimizations_qualities", :force => true do |t|
    t.integer "repository_id",                                                  :null => false
    t.integer "run_results_parameter_optimization_id",                          :null => false
    t.integer "run_results_parameter_optimizations_parameter_set_iteration_id", :null => false
    t.integer "clustering_quality_measure_id",                                  :null => false
    t.float   "quality",                                                        :null => false
  end

  add_index "run_results_parameter_optimizations_qualities", ["clustering_quality_measure_id"], :name => "fk_parameter_optimization_qualities_4"
  add_index "run_results_parameter_optimizations_qualities", ["repository_id", "clustering_quality_measure_id", "run_results_parameter_optimizations_parameter_set_iteration_id"], :name => "run_results_parameter_optimizations_qualities_sindex6", :unique => true
  add_index "run_results_parameter_optimizations_qualities", ["repository_id"], :name => "fk_parameter_optimization_qualities_1"
  add_index "run_results_parameter_optimizations_qualities", ["run_results_parameter_optimizations_parameter_set_iteration_id"], :name => "fk_parameter_optimization_qualities_2"
  add_index "run_results_parameter_optimizations_qualities", ["run_results_parameter_optimizations_parameter_set_iteration_id"], :name => "fk_parameter_optimization_qualities_3"
  add_index "run_results_parameter_optimizations_qualities", ["run_results_parameter_optimizations_parameter_set_iteration_id"], :name => "fk_run_results_parameter_optimizations_qualities_1"

  create_table "run_results_run_analyses", :force => true do |t|
    t.integer "repository_id",           :null => false
    t.integer "run_results_analysis_id", :null => false
  end

  add_index "run_results_run_analyses", ["repository_id", "run_results_analysis_id"], :name => "run_results_run_analyses_index4", :unique => true
  add_index "run_results_run_analyses", ["repository_id"], :name => "fk_runResultsRunAnalysis_1"
  add_index "run_results_run_analyses", ["run_results_analysis_id"], :name => "fk_runResultsRunAnalysis_2"

  create_table "run_results_run_data_analyses", :force => true do |t|
    t.integer "repository_id",           :null => false
    t.integer "run_results_analysis_id", :null => false
  end

  add_index "run_results_run_data_analyses", ["repository_id", "run_results_analysis_id"], :name => "run_results_run_data_analyses_index4", :unique => true
  add_index "run_results_run_data_analyses", ["repository_id"], :name => "fk_run_results_run_data_analysis_1"
  add_index "run_results_run_data_analyses", ["run_results_analysis_id"], :name => "fk_run_results_run_data_analysis_2"

  create_table "run_run_analyses", :force => true do |t|
    t.integer "repository_id",   :null => false
    t.integer "run_analysis_id", :null => false
  end

  add_index "run_run_analyses", ["repository_id", "run_analysis_id"], :name => "run_run_analyses_index4", :unique => true
  add_index "run_run_analyses", ["repository_id"], :name => "fk_runConfigsAnalysisRun_1"
  add_index "run_run_analyses", ["run_analysis_id"], :name => "fk_runConfigsAnalysisRun_2"

  create_table "run_run_analysis_run_identifiers", :force => true do |t|
    t.integer "repository_id",       :null => false
    t.integer "run_run_analysis_id", :null => false
    t.binary  "run_identifier",      :null => false
  end

  add_index "run_run_analysis_run_identifiers", ["repository_id", "run_run_analysis_id", "run_identifier"], :name => "run_run_analysis_run_identifiers_index5", :unique => true
  add_index "run_run_analysis_run_identifiers", ["repository_id"], :name => "fk_runConfigsAnalysisRunRunIdentifiers_1"
  add_index "run_run_analysis_run_identifiers", ["run_identifier"], :name => "fk_runConfigsAnalysisRunRunIdentifiers_3"
  add_index "run_run_analysis_run_identifiers", ["run_run_analysis_id"], :name => "fk_runConfigsAnalysisRunRunIdentifiers_2"

  create_table "run_run_data_analyses", :force => true do |t|
    t.integer "repository_id",   :null => false
    t.integer "run_analysis_id", :null => false
  end

  add_index "run_run_data_analyses", ["repository_id", "run_analysis_id"], :name => "run_run_data_analyses_index4", :unique => true
  add_index "run_run_data_analyses", ["repository_id"], :name => "fk_runs_analysis_run_data_1"
  add_index "run_run_data_analyses", ["run_analysis_id"], :name => "fk_runs_analysis_run_data_2"
  add_index "run_run_data_analyses", ["run_analysis_id"], :name => "fk_runs_run_data_analyses_1"

  create_table "run_run_data_analysis_data_identifiers", :force => true do |t|
    t.integer "repository_id",            :null => false
    t.integer "run_run_data_analysis_id", :null => false
    t.binary  "dataIdentifier",           :null => false
  end

  add_index "run_run_data_analysis_data_identifiers", ["repository_id", "run_run_data_analysis_id", "dataIdentifier"], :name => "run_run_data_analysis_data_identifiers_index4", :unique => true
  add_index "run_run_data_analysis_data_identifiers", ["repository_id"], :name => "fk_runs_run_data_analysis_data_identifiers_1"
  add_index "run_run_data_analysis_data_identifiers", ["run_run_data_analysis_id"], :name => "fk_runs_run_data_analysis_data_identifiers_2"

  create_table "run_run_data_analysis_run_identifiers", :force => true do |t|
    t.integer "repository_id",            :null => false
    t.integer "run_run_data_analysis_id", :null => false
    t.binary  "run_identifier",           :null => false
  end

  add_index "run_run_data_analysis_run_identifiers", ["repository_id", "run_run_data_analysis_id", "run_identifier"], :name => "run_run_data_analysis_run_identifiers_index4", :unique => true
  add_index "run_run_data_analysis_run_identifiers", ["repository_id"], :name => "fk_runs_run_data_analysis_run_identifiers_1"
  add_index "run_run_data_analysis_run_identifiers", ["run_run_data_analysis_id"], :name => "fk_runs_run_data_analysis_run_identifiers_2"

  create_table "run_types", :force => true do |t|
    t.binary "name"
  end

  add_index "run_types", ["name"], :name => "run_types_name_UNIQUE", :unique => true

  create_table "runs", :force => true do |t|
    t.integer "repository_id",                :null => false
    t.integer "run_type_id",                  :null => false
    t.integer "run_id"
    t.binary  "abs_path"
    t.binary  "name"
    t.string  "status",        :limit => 767, :null => false
  end

  add_index "runs", ["abs_path", "repository_id"], :name => "runs_abs_path_UNIQUE", :unique => true
  add_index "runs", ["repository_id"], :name => "fk_runConfigs_1"
  add_index "runs", ["run_id"], :name => "fk_runs_2"
  add_index "runs", ["run_type_id"], :name => "fk_runs_1"

  create_table "small_rankings", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "statistics", :force => true do |t|
    t.integer "repository_id", :null => false
    t.binary  "name",          :null => false
    t.binary  "alias",         :null => false
  end

  add_index "statistics", ["name", "repository_id"], :name => "statistics_name_UNIQUE", :unique => true
  add_index "statistics", ["repository_id"], :name => "fk_statistics_1"

  create_table "statistics_data", :force => true do |t|
    t.integer "repository_id", :null => false
    t.integer "statistic_id",  :null => false
  end

  add_index "statistics_data", ["repository_id", "statistic_id"], :name => "statistics_data_index4", :unique => true
  add_index "statistics_data", ["repository_id"], :name => "fk_statisticsData_2"
  add_index "statistics_data", ["statistic_id"], :name => "fk_statisticsData_1"

  create_table "statistics_run_data", :force => true do |t|
    t.integer "repository_id", :null => false
    t.integer "statistic_id",  :null => false
  end

  add_index "statistics_run_data", ["repository_id", "statistic_id"], :name => "statistics_run_data_index4", :unique => true
  add_index "statistics_run_data", ["repository_id"], :name => "fk_statisticsRunData_1"
  add_index "statistics_run_data", ["statistic_id"], :name => "fk_statisticsRunData_2"

  create_table "statistics_runs", :force => true do |t|
    t.integer "repository_id", :null => false
    t.integer "statistic_id",  :null => false
  end

  add_index "statistics_runs", ["repository_id", "statistic_id"], :name => "statistics_runs_index4", :unique => true
  add_index "statistics_runs", ["repository_id"], :name => "fk_statisticsRun_1"
  add_index "statistics_runs", ["statistic_id"], :name => "fk_statisticsRun_2"

  create_table "submit_datasets", :force => true do |t|
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "email",       :limit => 767, :null => false
    t.string   "firstname",   :limit => 767, :null => false
    t.string   "lastname",    :limit => 767, :null => false
    t.string   "institution", :limit => 767, :null => false
    t.string   "description", :limit => 767, :null => false
  end

  create_table "submit_methods", :force => true do |t|
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "email",       :limit => 767, :null => false
    t.string   "firstname",   :limit => 767, :null => false
    t.string   "lastname",    :limit => 767, :null => false
    t.string   "institution", :limit => 767, :null => false
    t.string   "description", :limit => 767, :null => false
  end

  create_table "submits", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login",                             :null => false
    t.string   "email",                             :null => false
    t.string   "crypted_password",                  :null => false
    t.string   "password_salt",                     :null => false
    t.string   "persistence_token",                 :null => false
    t.integer  "login_count",        :default => 0, :null => false
    t.integer  "failed_login_count", :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true

  add_foreign_key "cluster_objects", "clusters", name: "cluster_objects_cluster_id_fk", dependent: :delete
  add_foreign_key "cluster_objects", "repositories", name: "cluster_objects_repository_id_fk", dependent: :delete

  add_foreign_key "clustering_quality_measures", "repositories", name: "clustering_quality_measures_repository_id_fk", dependent: :delete

  add_foreign_key "clusterings", "repositories", name: "clusterings_repository_id_fk", dependent: :delete

  add_foreign_key "clusters", "clusterings", name: "clusters_clustering_id_fk", dependent: :delete
  add_foreign_key "clusters", "repositories", name: "clusters_repository_id_fk", dependent: :delete

  add_foreign_key "data_configs", "data_configs", name: "data_configs_data_config_id_fk", dependent: :delete
  add_foreign_key "data_configs", "dataset_configs", name: "data_configs_dataset_config_id_fk", dependent: :delete
  add_foreign_key "data_configs", "goldstandard_configs", name: "data_configs_goldstandard_config_id_fk", dependent: :delete
  add_foreign_key "data_configs", "repositories", name: "data_configs_repository_id_fk", dependent: :delete

  add_foreign_key "dataset_configs", "dataset_configs", name: "dataset_configs_dataset_config_id_fk", dependent: :delete
  add_foreign_key "dataset_configs", "datasets", name: "dataset_configs_dataset_id_fk", dependent: :delete
  add_foreign_key "dataset_configs", "repositories", name: "dataset_configs_repository_id_fk", dependent: :delete

  add_foreign_key "dataset_formats", "repositories", name: "dataset_formats_repository_id_fk", dependent: :delete

  add_foreign_key "dataset_types", "repositories", name: "dataset_types_repository_id_fk", dependent: :delete

  add_foreign_key "datasets", "dataset_formats", name: "datasets_dataset_format_id_fk", dependent: :delete
  add_foreign_key "datasets", "dataset_types", name: "datasets_dataset_type_id_fk", dependent: :delete
  add_foreign_key "datasets", "datasets", name: "datasets_dataset_id_fk", dependent: :delete
  add_foreign_key "datasets", "repositories", name: "datasets_repository_id_fk", dependent: :delete

  add_foreign_key "goldstandard_configs", "goldstandard_configs", name: "goldstandard_configs_goldstandard_config_id_fk", dependent: :delete
  add_foreign_key "goldstandard_configs", "goldstandards", name: "goldstandard_configs_goldstandard_id_fk", dependent: :delete
  add_foreign_key "goldstandard_configs", "repositories", name: "goldstandard_configs_repository_id_fk", dependent: :delete

  add_foreign_key "goldstandards", "goldstandards", name: "goldstandards_goldstandard_id_fk", dependent: :delete
  add_foreign_key "goldstandards", "repositories", name: "goldstandards_repository_id_fk", dependent: :delete

  add_foreign_key "optimizable_program_parameters", "program_configs", name: "optimizable_program_parameters_program_config_id_fk", dependent: :delete
  add_foreign_key "optimizable_program_parameters", "program_parameters", name: "optimizable_program_parameters_program_parameter_id_fk", dependent: :delete
  add_foreign_key "optimizable_program_parameters", "repositories", name: "optimizable_program_parameters_repository_id_fk", dependent: :delete

  add_foreign_key "parameter_optimization_methods", "repositories", name: "parameter_optimization_methods_repository_id_fk", dependent: :delete

  add_foreign_key "program_configs", "program_configs", name: "program_configs_program_config_id_fk", dependent: :delete
  add_foreign_key "program_configs", "programs", name: "program_configs_program_id_fk", dependent: :delete
  add_foreign_key "program_configs", "repositories", name: "program_configs_repository_id_fk", dependent: :delete
  add_foreign_key "program_configs", "run_result_formats", name: "program_configs_run_result_format_id_fk", dependent: :delete

  add_foreign_key "program_configs_compatible_dataset_formats", "dataset_formats", name: "program_configs_compatible_dataset_formats_dataset_format_id_fk", dependent: :delete
  add_foreign_key "program_configs_compatible_dataset_formats", "program_configs", name: "program_configs_compatible_dataset_formats_program_config_id_fk", dependent: :delete
  add_foreign_key "program_configs_compatible_dataset_formats", "repositories", name: "program_configs_compatible_dataset_formats_repository_id_fk", dependent: :delete

  add_foreign_key "program_parameters", "program_configs", name: "program_parameters_program_config_id_fk", dependent: :delete
  add_foreign_key "program_parameters", "program_parameter_types", name: "program_parameters_program_parameter_type_id_fk", dependent: :delete
  add_foreign_key "program_parameters", "repositories", name: "program_parameters_repository_id_fk", dependent: :delete

  add_foreign_key "programs", "repositories", name: "programs_repository_id_fk", dependent: :delete

  add_foreign_key "repositories", "repositories", name: "repositories_repository_id_fk", dependent: :delete
  add_foreign_key "repositories", "repository_types", name: "repositories_repository_type_id_fk", dependent: :delete

  add_foreign_key "run_analyses", "repositories", name: "run_analyses_repository_id_fk", dependent: :delete
  add_foreign_key "run_analyses", "runs", name: "run_analyses_run_id_fk", dependent: :delete

  add_foreign_key "run_analysis_statistics", "repositories", name: "run_analysis_statistics_repository_id_fk", dependent: :delete
  add_foreign_key "run_analysis_statistics", "run_analyses", name: "run_analysis_statistics_run_analysis_id_fk", column: "run_analysis_id", dependent: :delete
  add_foreign_key "run_analysis_statistics", "statistics", name: "run_analysis_statistics_statistic_id_fk", dependent: :delete

  add_foreign_key "run_clusterings", "repositories", name: "run_clusterings_repository_id_fk", dependent: :delete
  add_foreign_key "run_clusterings", "run_executions", name: "run_clusterings_run_execution_id_fk", dependent: :delete

  add_foreign_key "run_data_analyses", "repositories", name: "run_data_analyses_repository_id_fk", dependent: :delete
  add_foreign_key "run_data_analyses", "run_analyses", name: "run_data_analyses_run_analysis_id_fk", column: "run_analysis_id", dependent: :delete

  add_foreign_key "run_data_analysis_data_configs", "data_configs", name: "run_data_analysis_data_configs_data_config_id_fk", dependent: :delete
  add_foreign_key "run_data_analysis_data_configs", "repositories", name: "run_data_analysis_data_configs_repository_id_fk", dependent: :delete
  add_foreign_key "run_data_analysis_data_configs", "run_data_analyses", name: "run_data_analysis_data_configs_run_data_analysis_id_fk", column: "run_data_analysis_id", dependent: :delete

  add_foreign_key "run_execution_data_configs", "data_configs", name: "run_execution_data_configs_data_config_id_fk", dependent: :delete
  add_foreign_key "run_execution_data_configs", "repositories", name: "run_execution_data_configs_repository_id_fk", dependent: :delete
  add_foreign_key "run_execution_data_configs", "run_executions", name: "run_execution_data_configs_run_execution_id_fk", dependent: :delete

  add_foreign_key "run_execution_parameter_values", "program_configs", name: "run_execution_parameter_values_program_config_id_fk", dependent: :delete
  add_foreign_key "run_execution_parameter_values", "program_parameters", name: "run_execution_parameter_values_program_parameter_id_fk", dependent: :delete
  add_foreign_key "run_execution_parameter_values", "repositories", name: "run_execution_parameter_values_repository_id_fk", dependent: :delete
  add_foreign_key "run_execution_parameter_values", "run_executions", name: "run_execution_parameter_values_run_execution_id_fk", dependent: :delete

  add_foreign_key "run_execution_program_configs", "program_configs", name: "run_execution_program_configs_program_config_id_fk", dependent: :delete
  add_foreign_key "run_execution_program_configs", "repositories", name: "run_execution_program_configs_repository_id_fk", dependent: :delete
  add_foreign_key "run_execution_program_configs", "run_executions", name: "run_execution_program_configs_run_execution_id_fk", dependent: :delete

  add_foreign_key "run_execution_quality_measures", "clustering_quality_measures", name: "run_execution_quality_measures_clustering_quality_measure_id_fk", dependent: :delete
  add_foreign_key "run_execution_quality_measures", "repositories", name: "run_execution_quality_measures_repository_id_fk", dependent: :delete
  add_foreign_key "run_execution_quality_measures", "run_executions", name: "run_execution_quality_measures_run_execution_id_fk", dependent: :delete

  add_foreign_key "run_executions", "repositories", name: "run_executions_repository_id_fk", dependent: :delete
  add_foreign_key "run_executions", "runs", name: "run_executions_run_id_fk", dependent: :delete

  add_foreign_key "run_internal_parameter_optimizations", "repositories", name: "run_internal_parameter_optimizations_repository_id_fk", dependent: :delete
  add_foreign_key "run_internal_parameter_optimizations", "run_executions", name: "run_internal_parameter_optimizations_run_execution_id_fk", dependent: :delete

  add_foreign_key "run_parameter_optimization_methods", "clustering_quality_measures", name: "run_param_opt_methods_clustering_quality_measure_id_fk", dependent: :delete
  add_foreign_key "run_parameter_optimization_methods", "parameter_optimization_methods", name: "run_param_opt_methods_parameter_optimization_method_id_fk", dependent: :delete
  add_foreign_key "run_parameter_optimization_methods", "program_configs", name: "run_parameter_optimization_methods_program_config_id_fk", dependent: :delete
  add_foreign_key "run_parameter_optimization_methods", "repositories", name: "run_parameter_optimization_methods_repository_id_fk", dependent: :delete
  add_foreign_key "run_parameter_optimization_methods", "run_parameter_optimizations", name: "run_param_opt_methods_run_parameter_optimization_id_fk", dependent: :delete

  add_foreign_key "run_parameter_optimization_parameters", "program_configs", name: "run_param_opt_parameters_program_config_id_fk", dependent: :delete
  add_foreign_key "run_parameter_optimization_parameters", "program_parameters", name: "run_param_opt_parameters_program_parameter_id_fk", dependent: :delete
  add_foreign_key "run_parameter_optimization_parameters", "repositories", name: "run_param_opt_parameters_repository_id_fk", dependent: :delete
  add_foreign_key "run_parameter_optimization_parameters", "run_parameter_optimizations", name: "run_param_opt_parameters_run_parameter_optimization_id_fk", dependent: :delete

  add_foreign_key "run_parameter_optimization_quality_measures", "clustering_quality_measures", name: "run_param_opt_quality_measures_clustering_quality_measure_id_fk", dependent: :delete
  add_foreign_key "run_parameter_optimization_quality_measures", "repositories", name: "run_param_opt_quality_measures_repository_id_fk", dependent: :delete
  add_foreign_key "run_parameter_optimization_quality_measures", "run_parameter_optimizations", name: "run_param_opt_quality_measures_run_parameter_optimization_id_fk", dependent: :delete

  add_foreign_key "run_parameter_optimizations", "repositories", name: "run_parameter_optimizations_repository_id_fk", dependent: :delete
  add_foreign_key "run_parameter_optimizations", "run_executions", name: "run_parameter_optimizations_run_execution_id_fk", dependent: :delete

  add_foreign_key "run_result_formats", "repositories", name: "run_result_formats_repository_id_fk", dependent: :delete

  add_foreign_key "run_results", "repositories", name: "run_results_repository_id_fk", dependent: :delete
  add_foreign_key "run_results", "run_types", name: "run_results_run_type_id_fk", dependent: :delete
  add_foreign_key "run_results", "runs", name: "run_results_run_id_fk", dependent: :delete

  add_foreign_key "run_results_analyses", "repositories", name: "run_results_analyses_repository_id_fk", dependent: :delete
  add_foreign_key "run_results_analyses", "run_results", name: "run_results_analyses_run_result_id_fk", dependent: :delete

  add_foreign_key "run_results_clustering_qualities", "clustering_quality_measures", name: "fk_clustering_quals_qual_measures", dependent: :delete
  add_foreign_key "run_results_clustering_qualities", "data_configs", name: "fk_clustering_qualities_data_configs", dependent: :delete
  add_foreign_key "run_results_clustering_qualities", "program_configs", name: "fk_clustering_qualities_program_configs", dependent: :delete
  add_foreign_key "run_results_clustering_qualities", "repositories", name: "fk_clustering_qualities_repositories", dependent: :delete
  add_foreign_key "run_results_clustering_qualities", "run_results_clusterings", name: "fk_clustering_quals_run_results_clusterings", dependent: :delete

  add_foreign_key "run_results_clusterings", "repositories", name: "run_results_clusterings_repository_id_fk", dependent: :delete
  add_foreign_key "run_results_clusterings", "run_results_executions", name: "run_results_clusterings_run_results_execution_id_fk", dependent: :delete

  add_foreign_key "run_results_data_analyses", "repositories", name: "run_results_data_analyses_repository_id_fk", dependent: :delete
  add_foreign_key "run_results_data_analyses", "run_results_analyses", name: "run_results_data_analyses_run_results_analysis_id_fk", column: "run_results_analysis_id", dependent: :delete

  add_foreign_key "run_results_executions", "repositories", name: "run_results_executions_repository_id_fk", dependent: :delete
  add_foreign_key "run_results_executions", "run_results", name: "run_results_executions_run_result_id_fk", dependent: :delete

  add_foreign_key "run_results_internal_parameter_optimizations", "run_results_executions", name: "run_results_internal_param_opt_run_results_execution_id_fk", dependent: :delete

  add_foreign_key "run_results_parameter_optimizations", "data_configs", name: "run_results_parameter_optimizations_data_config_id_fk", dependent: :delete
  add_foreign_key "run_results_parameter_optimizations", "program_configs", name: "run_results_parameter_optimizations_program_config_id_fk", dependent: :delete
  add_foreign_key "run_results_parameter_optimizations", "repositories", name: "run_results_parameter_optimizations_repository_id_fk", dependent: :delete
  add_foreign_key "run_results_parameter_optimizations", "run_results_executions", name: "run_results_parameter_optimizations_run_results_execution_id_fk", dependent: :delete

  add_foreign_key "run_results_parameter_optimizations_parameter_set_iterations", "clusterings", name: "run_results_param_opt_parameter_set_iterations_clustering_id_fk", dependent: :delete
  add_foreign_key "run_results_parameter_optimizations_parameter_set_iterations", "repositories", name: "run_results_param_opt_param_set_iter_repository_id_fk", dependent: :delete
  add_foreign_key "run_results_parameter_optimizations_parameter_set_iterations", "run_results_parameter_optimizations_parameter_sets", name: "fk11", dependent: :delete

  add_foreign_key "run_results_parameter_optimizations_parameter_set_parameters", "program_parameters", name: "run_results_param_opt_parameter_set_param_program_param_id_fk", dependent: :delete
  add_foreign_key "run_results_parameter_optimizations_parameter_set_parameters", "repositories", name: "run_results_param_opt_param_set_param_repository_id_fk", dependent: :delete
  add_foreign_key "run_results_parameter_optimizations_parameter_set_parameters", "run_results_parameter_optimizations", name: "fk12", dependent: :delete
  add_foreign_key "run_results_parameter_optimizations_parameter_set_parameters", "run_results_parameter_optimizations_parameter_sets", name: "fk13", dependent: :delete

  add_foreign_key "run_results_parameter_optimizations_parameter_sets", "repositories", name: "fk14", dependent: :delete
  add_foreign_key "run_results_parameter_optimizations_parameter_sets", "run_results_parameter_optimizations", name: "fk15", dependent: :delete

  add_foreign_key "run_results_parameter_optimizations_parameter_values", "repositories", name: "fk16", dependent: :delete
  add_foreign_key "run_results_parameter_optimizations_parameter_values", "run_results_parameter_optimizations", name: "fk17", dependent: :delete
  add_foreign_key "run_results_parameter_optimizations_parameter_values", "run_results_parameter_optimizations_parameter_set_iterations", name: "fk18", dependent: :delete
  add_foreign_key "run_results_parameter_optimizations_parameter_values", "run_results_parameter_optimizations_parameter_set_parameters", name: "fk19", dependent: :delete

  add_foreign_key "run_results_parameter_optimizations_qualities", "clustering_quality_measures", name: "fk20", dependent: :delete
  add_foreign_key "run_results_parameter_optimizations_qualities", "repositories", name: "fk21", dependent: :delete
  add_foreign_key "run_results_parameter_optimizations_qualities", "run_results_parameter_optimizations", name: "fk22", dependent: :delete
  add_foreign_key "run_results_parameter_optimizations_qualities", "run_results_parameter_optimizations_parameter_set_iterations", name: "fk23", dependent: :delete

  add_foreign_key "run_results_run_analyses", "repositories", name: "run_results_run_analyses_repository_id_fk", dependent: :delete
  add_foreign_key "run_results_run_analyses", "run_results_analyses", name: "run_results_run_analyses_run_results_analysis_id_fk", column: "run_results_analysis_id", dependent: :delete

  add_foreign_key "run_results_run_data_analyses", "repositories", name: "run_results_run_data_analyses_repository_id_fk", dependent: :delete
  add_foreign_key "run_results_run_data_analyses", "run_results_analyses", name: "run_results_run_data_analyses_run_results_run_analysis_id_fk", column: "run_results_analysis_id", dependent: :delete

  add_foreign_key "run_run_analyses", "repositories", name: "run_run_analyses_repository_id_fk", dependent: :delete
  add_foreign_key "run_run_analyses", "run_analyses", name: "run_run_analyses_run_analysis_id_fk", column: "run_analysis_id", dependent: :delete

  add_foreign_key "run_run_analysis_run_identifiers", "repositories", name: "run_run_analysis_run_identifiers_repository_id_fk", dependent: :delete
  add_foreign_key "run_run_analysis_run_identifiers", "run_run_analyses", name: "run_run_analysis_run_identifiers_run_run_analysis_id_fk", column: "run_run_analysis_id", dependent: :delete

  add_foreign_key "run_run_data_analyses", "repositories", name: "run_run_data_analyses_repository_id_fk", dependent: :delete
  add_foreign_key "run_run_data_analyses", "run_analyses", name: "run_run_data_analyses_run_run_analysis_id_fk", column: "run_analysis_id", dependent: :delete

  add_foreign_key "run_run_data_analysis_data_identifiers", "repositories", name: "run_run_data_analysis_data_identifiers_repository_id_fk", dependent: :delete
  add_foreign_key "run_run_data_analysis_data_identifiers", "run_run_data_analyses", name: "fk24", column: "run_run_data_analysis_id", dependent: :delete

  add_foreign_key "runs", "repositories", name: "runs_repository_id_fk", dependent: :delete
  add_foreign_key "runs", "run_types", name: "runs_run_type_id_fk", dependent: :delete
  add_foreign_key "runs", "runs", name: "runs_run_id_fk", dependent: :delete

  add_foreign_key "statistics", "repositories", name: "statistics_repository_id_fk", dependent: :delete

  add_foreign_key "statistics_data", "repositories", name: "statistics_data_repository_id_fk", dependent: :delete
  add_foreign_key "statistics_data", "statistics", name: "statistics_data_statistic_id_fk", dependent: :delete

  add_foreign_key "statistics_run_data", "repositories", name: "statistics_run_data_repository_id_fk", dependent: :delete
  add_foreign_key "statistics_run_data", "statistics", name: "statistics_run_data_statistic_id_fk", dependent: :delete

  add_foreign_key "statistics_runs", "repositories", name: "statistics_runs_repository_id_fk", dependent: :delete
  add_foreign_key "statistics_runs", "statistics", name: "statistics_runs_statistic_id_fk", dependent: :delete

# Could not dump view "dataset_statistics" because of following RuntimeError
#   No view called dataset_statistics found

# Could not dump view "datasets_recent_statistics" because of following RuntimeError
#   No view called datasets_recent_statistics found

# Could not dump view "parameter_optimization_iterations" because of following RuntimeError
#   No view called parameter_optimization_iterations found

  create_view "parameter_optimization_data_configs_iterations", " SELECT dcorig.id AS data_config_id,\n    ps.id AS program_id,\n    it.clustering_quality_measure_id,\n    it.quality,\n    it.param_set_as_string\n   FROM programs ps,\n    data_configs dcs,\n    data_configs dcorig,\n    program_configs pcs,\n    parameter_optimization_iterations it\n  WHERE ((((it.data_config_id = dcs.id) AND (it.program_config_id = pcs.id)) AND (dcs.data_config_id = dcorig.id)) AND (pcs.program_id = ps.id));", :force => true do |v|
    v.column :data_config_id
    v.column :program_id
    v.column :clustering_quality_measure_id
    v.column :quality
    v.column :param_set_as_string
  end

# Could not dump view "parameter_optimization_iterations_exts" because of following RuntimeError
#   No view called parameter_optimization_iterations_exts found

# Could not dump view "parameter_optimization_max_quals" because of following RuntimeError
#   No view called parameter_optimization_max_quals found

# Could not dump view "parameter_optimization_max_qual_rows" because of following RuntimeError
#   No view called parameter_optimization_max_qual_rows found

# Could not dump view "parameter_optimization_min_quals" because of following RuntimeError
#   No view called parameter_optimization_min_quals found

# Could not dump view "parameter_optimization_min_qual_rows" because of following RuntimeError
#   No view called parameter_optimization_min_qual_rows found

end
