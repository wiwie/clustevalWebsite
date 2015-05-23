class CreateSubmitDatasets < ActiveRecord::Migration
  def change
    create_table :submit_datasets do |t|

      t.timestamps
		t.string 'email', :limit => 767, :null => false
		t.string 'firstname', :limit => 767, :null => false
		t.string 'lastname', :limit => 767, :null => false
		t.string 'institution', :limit => 767, :null => false
		t.string 'description', :limit => 767, :null => false
    end
  end
end
