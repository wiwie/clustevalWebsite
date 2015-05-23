class CreateDatasets < ActiveRecord::Migration
  def change
    create_table :datasets do |t|

    t.integer "repository_id",                    :null => false
    t.binary  "abs_path",           :limit => 767, :null => false
    t.integer "dataset_format_id",                :null => false
    t.integer "dataset_id"
    t.integer "checksum",                         :null => false
    t.integer "dataset_type_id",                  :null => false
  end

  add_index "datasets", ["abs_path", "repository_id"], :name => "datasets_abs_path_UNIQUE", :unique => true, :length => {"abs_path" => 767}
  add_index "datasets", ["dataset_id"], :name => "fk_datasets_3"
  add_index "datasets", ["dataset_format_id"], :name => "fk_datasets_1"
  add_index "datasets", ["repository_id"], :name => "fk_datasets_2"
  add_index "datasets", ["dataset_type_id"], :name => "fk_datasets_4"
  end
end
