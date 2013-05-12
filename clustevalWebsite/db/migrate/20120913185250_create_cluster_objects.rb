class CreateClusterObjects < ActiveRecord::Migration
  def change
    create_table :cluster_objects do |t|
	    t.integer "repository_id",                :null => false
	    t.integer "cluster_id",                   :null => false
	    t.binary  "name",          :limit => 200, :null => false
    end

	  add_index "cluster_objects", ["cluster_id"], :name => "fk_cluster_objects_2"
	  add_index "cluster_objects", ["repository_id"], :name => "fk_cluster_objects_1"
  end
end
