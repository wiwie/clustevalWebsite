class CreateGoldstandards < ActiveRecord::Migration
  def change
    create_table :goldstandards do |t|

    t.integer "repository_id",                     :null => false
    t.binary  "abs_path",            :limit => 767, :null => false
    t.integer "goldstandard_id"
  end

  add_index "goldstandards", ["abs_path", "repository_id"], :name => "goldstandards_abs_path_UNIQUE", :unique => true, :length => {"abs_path" => 767}
  add_index "goldstandards", ["goldstandard_id"], :name => "fk_goldstandards_2"
  add_index "goldstandards", ["repository_id"], :name => "fk_goldstandards_1"
  end
end
