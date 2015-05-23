class CreateDatasetPublications < ActiveRecord::Migration
  def change
    create_table :dataset_publications do |t|
    	t.binary 'dataset_fullName',   :limit => 767, :null => false
    	t.binary 'dataset_publication',   :limit => 767, :null => false
    	t.binary 'dataset_publicationUrl',   :limit => 767, :null => false
    end

    add_index "dataset_publications", ["dataset_fullName"], :name => "fk_dataset_publications_1", :unique => true, :length => {"dataset_fullName" => 767}
  end
end
