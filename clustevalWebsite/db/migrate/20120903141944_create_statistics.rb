class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|

    t.integer "repository_id",                :null => false
    t.binary  "name",          :limit => 200, :null => false
	t.binary  "alias",       :limit => 200, :null => false
  end

  add_index "statistics", ["name", "repository_id"], :name => "name_UNIQUE", :unique => true, :length => {"name" => 200}
  add_index "statistics", ["repository_id"], :name => "fk_statistics_1"
  end
end
