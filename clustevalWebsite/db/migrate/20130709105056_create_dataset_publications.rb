class CreateDatasetPublications < ActiveRecord::Migration
  def change
    create_table :dataset_publications do |t|
    	t.string 'dataset_fullName',   :limit => 200, :null => false
    	t.string 'dataset_publication',   :limit => 1000, :null => false
    	t.string 'dataset_publicationUrl',   :limit => 1000, :null => false
    end

    add_index "dataset_publications", ["dataset_fullName"], :name => "fk_dataset_publications_1", :unique => true
  end
end
