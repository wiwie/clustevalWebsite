class AddIndexToProgramConfigsRankingsView < ActiveRecord::Migration
  def up
  	add_index :run_results_program_configs_rankings, [:t10_r0, :t4_r4], :name => :progConfRank_k5
  end
end
