class CreateDatasetImages < ActiveRecord::Migration
  def change
    create_table :dataset_images do |t|
    	t.string 'dataset_fullName',   :limit => 200, :null => false
    	t.string 'dataset_imageUrl',   :limit => 500, :null => false
    end

    add_index "dataset_images", ["dataset_fullName"], :name => "fk_dataset_images_1", :unique => true
  end
end
