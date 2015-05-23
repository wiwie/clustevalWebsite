class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|

    t.binary  "base_path",             :limit => 767, :null => false
    t.integer "repository_id"
    t.integer "repository_type_id",                  :null => false
  end

  add_index "repositories", ["base_path"], :name => "repositories_index2", :unique => true, :length => {"base_path" => 767}
  add_index "repositories", ["repository_id"], :name => "fk_repositories_3"
  add_index "repositories", ["repository_type_id"], :name => "fk_repositories_1"
  end
end
