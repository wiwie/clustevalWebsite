class CreateSmallRankings < ActiveRecord::Migration
  def change
    create_table :small_rankings do |t|

      t.timestamps
    end
  end
end
