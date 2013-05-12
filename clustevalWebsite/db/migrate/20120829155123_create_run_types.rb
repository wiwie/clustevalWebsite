class CreateRunTypes < ActiveRecord::Migration
  def change
    create_table :run_types do |t|

    t.binary "name", :limit => 200
  end

  add_index "run_types", ["name"], :name => "name_UNIQUE", :unique => true, :length => {"name" => 200}
  end
end
