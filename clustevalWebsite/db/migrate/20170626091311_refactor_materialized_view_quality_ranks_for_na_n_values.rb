class RefactorMaterializedViewQualityRanksForNaNValues < ActiveRecord::Migration
  def down
	execute "drop materialized view clustering_quality_measures_spearman_correlations;"
        execute "drop materialized view parameter_optimization_iterations_woparam_ranks"
	execute "CREATE MATERIALIZED VIEW parameter_optimization_iterations_woparam_ranks as ( (SELECT clustering_quality_measure_id, run_results_parameter_optimizations_parameter_set_iteration_id, rank() OVER (PARTITION BY clustering_quality_measure_id ORDER BY quality DESC) as rank FROM parameter_optimization_iterations_woparam its, data_configs dcs, dataset_configs dscs, datasets ds, dataset_types tps WHERE its.data_config_id = dcs.id AND dcs.dataset_config_id = dscs.id AND dscs.dataset_id = ds.id AND ds.dataset_type_id = tps.id AND tps.name IN ('PPIDataSetType','ProteinSequenceSimilarityDataSetType','ProteinStructureSimilarityDataSetType','GeneExpressionDataSetType') ));"
	execute "create materialized view clustering_quality_measures_spearman_correlations as select b1.clustering_quality_measure_id clustering_quality_measure_1_id, b2.clustering_quality_measure_id clustering_quality_measure_2_id, corr(b1.rank,b2.rank) from parameter_optimization_iterations_woparam_ranks b1, parameter_optimization_iterations_woparam_ranks b2 where b1.run_results_parameter_optimizations_parameter_set_iteration_id=b2.run_results_parameter_optimizations_parameter_set_iteration_id group by b1.clustering_quality_measure_id,b2.clustering_quality_measure_id;"
  end

  def up
	execute "drop materialized view clustering_quality_measures_spearman_correlations;"
	execute "drop materialized view parameter_optimization_iterations_woparam_ranks"
        execute "CREATE MATERIALIZED VIEW parameter_optimization_iterations_woparam_ranks as ( (SELECT clustering_quality_measure_id, run_results_parameter_optimizations_parameter_set_iteration_id, rank() OVER (PARTITION BY clustering_quality_measure_id ORDER BY quality DESC) as rank FROM parameter_optimization_iterations_woparam its, data_configs dcs, dataset_configs dscs, datasets ds, dataset_types tps WHERE its.quality != 'NaN' AND its.data_config_id = dcs.id AND dcs.dataset_config_id = dscs.id AND dscs.dataset_id = ds.id AND ds.dataset_type_id = tps.id AND tps.name IN ('PPIDataSetType','ProteinSequenceSimilarityDataSetType','ProteinStructureSimilarityDataSetType','GeneExpressionDataSetType') ));"
	execute "create materialized view clustering_quality_measures_spearman_correlations as select b1.clustering_quality_measure_id clustering_quality_measure_1_id, b2.clustering_quality_measure_id clustering_quality_measure_2_id, corr(b1.rank,b2.rank) from parameter_optimization_iterations_woparam_ranks b1, parameter_optimization_iterations_woparam_ranks b2 where b1.run_results_parameter_optimizations_parameter_set_iteration_id=b2.run_results_parameter_optimizations_parameter_set_iteration_id group by b1.clustering_quality_measure_id,b2.clustering_quality_measure_id;"
  end
end
