class CreateDatasetTypes < ActiveRecord::Migration
  def change
    create_table :dataset_types do |t|
    	t.integer "repository_id",        :null => false
    	t.binary 'name', :limit => 200, :null => false
      t.binary "alias", :limit => 200, :null => false
    end

	 add_index "dataset_types", ["repository_id"], :name => "fk_dataset_types_1"
    add_index "dataset_types", ["repository_id","name"], :name => "index_dataset_types_name", :unique => true, :length => {"name" => 200}
    add_foreign_key "dataset_types", "repositories", :name => "dataset_types_repository_id_fk", dependent: :delete
    add_foreign_key "datasets", "dataset_types", :name => "datasets_dataset_type_id_fk", dependent: :delete
  end
end
