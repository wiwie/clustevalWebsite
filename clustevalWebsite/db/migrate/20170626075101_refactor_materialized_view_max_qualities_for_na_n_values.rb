class RefactorMaterializedViewMaxQualitiesForNaNValues < ActiveRecord::Migration
  def down
        execute "DROP MATERIALIZED VIEW parameter_optimization_max_qual_rows;";
        execute "DROP MATERIALIZED VIEW parameter_optimization_max_quals;";
	execute "CREATE MATERIALIZED VIEW parameter_optimization_max_quals AS select dataset_id,program_id,clustering_quality_measure_id,max(quality) as maxQuality from parameter_optimization_iterations_exts group by dataset_id,program_id,clustering_quality_measure_id;"
	execute "CREATE MATERIALIZED VIEW parameter_optimization_max_qual_rows AS select iter.* from parameter_optimization_iterations_exts iter inner join parameter_optimization_max_quals groupediter on iter.dataset_id = groupediter.dataset_id and iter.program_id = groupediter.program_id and iter.clustering_quality_measure_id = groupediter.clustering_quality_measure_id and iter.quality = groupediter.maxQuality;"
  end

  def up
	execute "DROP MATERIALIZED VIEW parameter_optimization_max_qual_rows;";
	execute "DROP MATERIALIZED VIEW parameter_optimization_max_quals;";
	execute "CREATE MATERIALIZED VIEW parameter_optimization_max_quals AS select dataset_id,program_id,clustering_quality_measure_id,min(maxQuality) as maxQuality from (select dataset_id,program_id,clustering_quality_measure_id,max(quality) as maxQuality from parameter_optimization_iterations_exts group by dataset_id,program_id,clustering_quality_measure_id UNION select dataset_id,program_id,clustering_quality_measure_id,max(quality) as maxQuality from parameter_optimization_iterations_exts where quality != 'NaN' group by dataset_id,program_id,clustering_quality_measure_id) sub group by dataset_id,program_id,clustering_quality_measure_id;"
	execute "CREATE MATERIALIZED VIEW parameter_optimization_max_qual_rows AS select iter.* from parameter_optimization_iterations_exts iter inner join parameter_optimization_max_quals groupediter on iter.dataset_id = groupediter.dataset_id and iter.program_id = groupediter.program_id and iter.clustering_quality_measure_id = groupediter.clustering_quality_measure_id and iter.quality = groupediter.maxQuality;"
  end
end
