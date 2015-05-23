class CreateClusterings < ActiveRecord::Migration
  def change
    create_table :clusterings do |t|

    t.integer "repository_id",                :null => false
    t.binary  "abs_path",       :limit => 767, :null => false
  end

  add_index "clusterings", ["abs_path"], :name => "clusterings_index3", :unique => true, :length => {"abs_path" => 767}
  add_index "clusterings", ["repository_id"], :name => "fk_clusterings_1"
  end
end
