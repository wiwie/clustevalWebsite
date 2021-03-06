class CreateRunTypes < ActiveRecord::Migration
  def change
    create_table :run_types do |t|

    t.binary "name", :limit => 767
  end

  add_index "run_types", ["name"], :name => "run_types_name_UNIQUE", :unique => true, :length => {"name" => 767}
  end
end
