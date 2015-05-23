class CreateDatasetDescriptions < ActiveRecord::Migration
  def change
    create_table :dataset_descriptions do |t|
    	t.binary 'dataset_fullName',   :limit => 767, :null => false
    	t.binary 'dataset_description',   :limit => 767, :null => false
    end

    add_index "dataset_descriptions", ["dataset_fullName"], :name => "fk_dataset_descriptions_1", :unique => true, :length => {"dataset_fullName" => 767}
  end
end
