class CreateStatisticsData < ActiveRecord::Migration
  def change
    create_table :statistics_datas do |t|

    t.integer "repository_id", :null => false
    t.integer "statistic_id",  :null => false
  end

  add_index "statistics_datas", ["repository_id", "statistic_id"], :name => "index4", :unique => true
  add_index "statistics_datas", ["repository_id"], :name => "fk_statisticsData_2"
  add_index "statistics_datas", ["statistic_id"], :name => "fk_statisticsData_1"
  end
end
