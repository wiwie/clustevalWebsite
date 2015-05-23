class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|

    t.integer "repository_id",                :null => false
    t.binary  "name",          :limit => 767, :null => false
	t.binary  "alias",       :limit => 767, :null => false
  end

  add_index "statistics", ["name", "repository_id"], :name => "statistics_name_UNIQUE", :unique => true, :length => {"name" => 767}
  add_index "statistics", ["repository_id"], :name => "fk_statistics_1"
  end
end
