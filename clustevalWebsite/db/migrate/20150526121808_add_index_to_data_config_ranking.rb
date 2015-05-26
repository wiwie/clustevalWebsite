class AddIndexToDataConfigRanking < ActiveRecord::Migration
  def change
  	add_index "run_results_data_configs_rankings", ["t9_r3", "t5_r2"], :name => "data_config_rankings_k1"
  	add_index "run_results_data_configs_rankings", ["t9_r3", "t10_r6"], :name => "data_config_rankings_k2"
  	add_index "run_results_data_configs_rankings", ["t9_r3", "t0_r3"], :name => "data_config_rankings_k3"
  	add_index "run_results_data_configs_rankings", ["t9_r3", "t10_r6", "t0_r3"], :name => "data_config_rankings_k4"
  	add_index "run_results_data_configs_rankings", ["t9_r3", "t4_r4"], :name => "data_config_rankings_k5"
  end
end
