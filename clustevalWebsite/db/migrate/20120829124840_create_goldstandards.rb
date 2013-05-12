class CreateGoldstandards < ActiveRecord::Migration
  def change
    create_table :goldstandards do |t|

    t.integer "repository_id",                     :null => false
    t.binary  "absPath",            :limit => 200, :null => false
    t.integer "goldstandard_id"
  end

  add_index "goldstandards", ["absPath", "repository_id"], :name => "absPath_UNIQUE", :unique => true, :length => {"absPath" => 200}
  add_index "goldstandards", ["goldstandard_id"], :name => "fk_goldstandards_2"
  add_index "goldstandards", ["repository_id"], :name => "fk_goldstandards_1"
  end
end
