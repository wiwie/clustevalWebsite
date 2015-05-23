class CreateStatisticsData < ActiveRecord::Migration
  def change
    create_table :statistics_data do |t|

    t.integer "repository_id", :null => false
    t.integer "statistic_id",  :null => false
  end

  add_index "statistics_data", ["repository_id", "statistic_id"], :name => "statistics_data_index4", :unique => true
  add_index "statistics_data", ["repository_id"], :name => "fk_statisticsData_2"
  add_index "statistics_data", ["statistic_id"], :name => "fk_statisticsData_1"
  end
end
