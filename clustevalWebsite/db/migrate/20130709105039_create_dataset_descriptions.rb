class CreateDatasetDescriptions < ActiveRecord::Migration
  def change
    create_table :dataset_descriptions do |t|
    	t.string 'dataset_fullName',   :limit => 200, :null => false
    	t.string 'dataset_description',   :limit => 1000, :null => false
    end

    add_index "dataset_descriptions", ["dataset_fullName"], :name => "fk_dataset_descriptions_1", :unique => true
  end
end
