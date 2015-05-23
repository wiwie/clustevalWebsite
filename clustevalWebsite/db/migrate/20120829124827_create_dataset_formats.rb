class CreateDatasetFormats < ActiveRecord::Migration
  def change
    create_table :dataset_formats do |t|

    t.integer "repository_id",                :null => false
    t.binary  "name",          :limit => 767
    t.binary "alias", :limit => 767, :null => false
  end

  add_index "dataset_formats", ["name", "repository_id"], :name => "dataset_formats_name_UNIQUE", :unique => true, :length => {"name" => 767}
  add_index "dataset_formats", ["repository_id"], :name => "fk_dataSetFormats_1"
  end
end
