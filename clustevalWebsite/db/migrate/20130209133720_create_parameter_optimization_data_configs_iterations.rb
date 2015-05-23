class CreateParameterOptimizationDataConfigsIterations < ActiveRecord::Migration
  def change
    execute "CREATE  VIEW parameter_optimization_data_configs_iterations AS select dcOrig.id AS data_config_id,ps.id AS program_id,it.clustering_quality_measure_id AS clustering_quality_measure_id,it.quality AS quality,it.param_set_as_string AS param_set_as_string from programs ps, data_configs dcs, data_configs dcOrig, program_configs pcs, parameter_optimization_iterations it where ((it.data_config_id = dcs.id) and (it.program_config_id = pcs.id) and (dcs.data_config_id = dcOrig.id) and (pcs.program_id = ps.id))"
  end
end
