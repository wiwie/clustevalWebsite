class CreateClusterings < ActiveRecord::Migration
  def change
    create_table :clusterings do |t|

    t.integer "repository_id",                :null => false
    t.binary  "absPath",       :limit => 200, :null => false
  end

  add_index "clusterings", ["absPath"], :name => "index3", :unique => true, :length => {"absPath" => 200}
  add_index "clusterings", ["repository_id"], :name => "fk_clusterings_1"
  end
end
