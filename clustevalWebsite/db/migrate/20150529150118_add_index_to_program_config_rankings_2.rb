class AddIndexToProgramConfigRankings2 < ActiveRecord::Migration
  def change
  	add_index "run_results_program_configs_rankings", ["t4_r4","t9_r4"], :name => "progConfRank_k5"
  end
end
