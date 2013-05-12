class CreateClusters < ActiveRecord::Migration
  def change
    create_table :clusters do |t|

    t.integer "repository_id",                :null => false
    t.integer "clustering_id",                :null => false
    t.binary  "name",          :limit => 200, :null => false
  end

  add_index "clusters", ["clustering_id"], :name => "fk_clusters_2"
  add_index "clusters", ["repository_id"], :name => "fk_clusters_1"
  end
end
