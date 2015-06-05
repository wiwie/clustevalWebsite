class ChangeIndexOnProgramConfigsRankings < ActiveRecord::Migration
  def up
  	add_index :run_results_program_configs_rankings, [:t4_r4,:t10_r0], :name => :progConfRank_k5
  end

  def down
  end
end
