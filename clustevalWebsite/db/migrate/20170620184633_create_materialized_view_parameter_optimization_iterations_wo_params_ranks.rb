class CreateMaterializedViewParameterOptimizationIterationsWoParamsRanks < ActiveRecord::Migration
  def down
	execute "drop materialized view parameter_optimization_iterations_woparam_ranks"
  end

  def up
        execute "CREATE MATERIALIZED VIEW parameter_optimization_iterations_woparam_ranks as (SELECT clustering_quality_measure_id, run_results_parameter_optimizations_parameter_set_iteration_id, rank() OVER (PARTITION BY clustering_quality_measure_id ORDER BY quality DESC) as rank FROM parameter_optimization_iterations_woparam WHERE data_config_id in (7495, 7571, 7491, 7494, 7867, 7547, 7550, 7868, 7865));"
  end
end
