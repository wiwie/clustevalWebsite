class CreateStatisticsRuns < ActiveRecord::Migration
  def change
    create_table :statistics_runs do |t|

    t.integer "repository_id", :null => false
    t.integer "statistic_id",  :null => false
  end

  add_index "statistics_runs", ["repository_id", "statistic_id"], :name => "index4", :unique => true
  add_index "statistics_runs", ["repository_id"], :name => "fk_statisticsRun_1"
  add_index "statistics_runs", ["statistic_id"], :name => "fk_statisticsRun_2"
  end
end
