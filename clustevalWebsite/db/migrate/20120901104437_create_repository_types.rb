class CreateRepositoryTypes < ActiveRecord::Migration
  def change
    create_table :repository_types do |t|

    t.binary "name", :limit => 200
  end

  add_index "repository_types", ["name"], :name => "name_UNIQUE", :unique => true, :length => {"name" => 200}
  end
end
