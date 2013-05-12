class CreateGoldstandardConfigs < ActiveRecord::Migration
  def change
    create_table :goldstandard_configs do |t|

    t.integer "repository_id",                         :null => false
    t.binary  "absPath",                :limit => 200
    t.binary  "name",                   :limit => 200
    t.integer "goldstandard_id",                       :null => false
    t.integer "goldstandard_config_id"
  end

  add_index "goldstandard_configs", ["absPath", "repository_id"], :name => "absPath_UNIQUE", :unique => true, :length => {"absPath" => 200}
  add_index "goldstandard_configs", ["goldstandard_config_id"], :name => "fk_goldstandard_configs_1"
  add_index "goldstandard_configs", ["goldstandard_id"], :name => "fk_goldStandardConfigs_2"
  add_index "goldstandard_configs", ["repository_id"], :name => "fk_goldStandardConfigs_1"
  end
end
