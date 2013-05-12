class CreateStatisticsRunData < ActiveRecord::Migration
  def change
    create_table :statistics_run_datas do |t|

    t.integer "repository_id", :null => false
    t.integer "statistic_id",  :null => false
  end

  add_index "statistics_run_datas", ["repository_id", "statistic_id"], :name => "index4", :unique => true
  add_index "statistics_run_datas", ["repository_id"], :name => "fk_statisticsRunData_1"
  add_index "statistics_run_datas", ["statistic_id"], :name => "fk_statisticsRunData_2"
  end
end
