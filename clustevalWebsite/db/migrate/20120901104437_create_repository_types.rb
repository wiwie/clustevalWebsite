class CreateRepositoryTypes < ActiveRecord::Migration
  def change
    create_table :repository_types do |t|

    t.binary "name", :limit => 767
  end

  add_index "repository_types", ["name"], :name => "repository_types_name_UNIQUE", :unique => true, :length => {"name" => 767}
  end
end
