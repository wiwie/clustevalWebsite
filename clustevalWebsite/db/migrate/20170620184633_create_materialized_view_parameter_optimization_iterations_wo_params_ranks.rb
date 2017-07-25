class CreateMaterializedViewParameterOptimizationIterationsWoParamsRanks < ActiveRecord::Migration
  def down
	execute "drop materialized view parameter_optimization_iterations_woparam_ranks"
  end

  def up
        execute "CREATE MATERIALIZED VIEW parameter_optimization_iterations_woparam_ranks as ( (SELECT clustering_quality_measure_id, run_results_parameter_optimizations_parameter_set_iteration_id, rank() OVER (PARTITION BY clustering_quality_measure_id ORDER BY quality DESC) as rank FROM parameter_optimization_iterations_woparam its, data_configs dcs, dataset_configs dscs, datasets ds, dataset_types tps WHERE its.data_config_id = dcs.id AND dcs.dataset_config_id = dscs.id AND dscs.dataset_id = ds.id AND ds.dataset_type_id = tps.id AND tps.name IN ('PPIDataSetType','ProteinSequenceSimilarityDataSetType','ProteinStructureSimilarityDataSetType','GeneExpressionDataSetType') ));"
  end
end
