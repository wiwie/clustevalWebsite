class AddIndexToDataConfigRankings < ActiveRecord::Migration
  def change
  	add_index "run_results_data_configs_rankings", ["t9_r3","t4_r4"], :name => "dataConfRank_k1"
  end
end
