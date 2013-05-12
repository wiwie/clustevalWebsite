class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|

    t.binary  "basePath",             :limit => 200, :null => false
    t.integer "repository_id"
    t.integer "repository_type_id",                  :null => false
  end

  add_index "repositories", ["basePath"], :name => "index2", :unique => true, :length => {"basePath" => 200}
  add_index "repositories", ["repository_id"], :name => "fk_repositories_3"
  add_index "repositories", ["repository_type_id"], :name => "fk_repositories_1"
  end
end
