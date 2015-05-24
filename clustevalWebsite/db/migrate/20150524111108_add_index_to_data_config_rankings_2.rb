class AddIndexToDataConfigRankings2 < ActiveRecord::Migration
  def change
  	add_index "run_results_data_configs_rankings", ["t9_r3","t5_r2","t4_r4"], :name => "dataConfRank_k2"
  	add_index "run_results_data_configs_rankings", ["t9_r3","t10_r6","t4_r4"], :name => "dataConfRank_k3"
  	add_index "run_results_data_configs_rankings", ["t9_r3","t0_r3","t4_r4"], :name => "dataConfRank_k4"
  end
end
