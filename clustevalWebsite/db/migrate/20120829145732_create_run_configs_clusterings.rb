class CreateRunConfigsClusterings < ActiveRecord::Migration
  def change
    create_table :run_clusterings do |t|

    t.integer "repository_id",    :null => false
    t.integer "run_execution_id", :null => false
  end

  add_index "run_clusterings", ["repository_id", "run_execution_id"], :name => "index4", :unique => true
  add_index "run_clusterings", ["repository_id"], :name => "fk_runConfigsClustering_2"
  add_index "run_clusterings", ["run_execution_id"], :name => "fk_runConfigsClustering_1"
  add_index "run_clusterings", ["run_execution_id"], :name => "fk_run_clusterings_1"
  end
end
