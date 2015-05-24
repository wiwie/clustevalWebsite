class AddIndexToProgramConfigRankings < ActiveRecord::Migration
  def change
  	add_index "run_results_program_configs_rankings", ["t9_r4","t4_r4"], :name => "progConfRank_k1"
  	add_index "run_results_program_configs_rankings", ["t9_r4","t5_r2","t4_r4"], :name => "progConfRank_k2"
  	add_index "run_results_program_configs_rankings", ["t9_r4","t10_r6","t4_r4"], :name => "progConfRank_k3"
  	add_index "run_results_program_configs_rankings", ["t9_r4","t0_r3","t4_r4"], :name => "progConfRank_k4"
  end
end
