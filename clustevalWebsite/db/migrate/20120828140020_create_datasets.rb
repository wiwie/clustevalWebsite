class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|

    t.integer "repository_id",                    :null => false
    t.binary  "absPath",           :limit => 200, :null => false
    t.integer "dataset_format_id",                :null => false
    t.integer "dataset_id"
    t.integer "checksum",                         :null => false
    t.integer "dataset_type_id",                  :null => false
  end

  add_index "datasets", ["absPath", "repository_id"], :name => "absPath_UNIQUE", :unique => true, :length => {"absPath" => 200}
  add_index "datasets", ["dataset_id"], :name => "fk_datasets_3"
  add_index "datasets", ["dataset_format_id"], :name => "fk_datasets_1"
  add_index "datasets", ["repository_id"], :name => "fk_datasets_2"
  add_index "datasets", ["dataset_type_id"], :name => "fk_datasets_4"
  end
end
