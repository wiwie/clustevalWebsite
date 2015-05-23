class CreateRunResultFormats < ActiveRecord::Migration
  def change
    create_table :run_result_formats do |t|

    t.integer "repository_id",                :null => false
    t.binary  "name",          :limit => 767, :null => false
  end

  add_index "run_result_formats", ["name", "repository_id"], :name => "run_result_formats_index2", :unique => true, :length => {"name" => 767}
  add_index "run_result_formats", ["repository_id"], :name => "fk_runResultFormats_1"
  end
end
