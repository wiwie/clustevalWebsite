class CreateDatasetConfigsDatasets < ActiveRecord::Migration
  def change
    create_table :dataset_configs_datasets do |t|
      t.integer :dataset_id
      t.integer :dataset_config_id
    end
      
    add_foreign_key "dataset_configs_datasets", "datasets", :name => "dataset_configs_datasets_fk1", dependent: :delete
    add_foreign_key "dataset_configs_datasets", "dataset_configs", :name => "dataset_configs_datasets_fk2", dependent: :delete
  end
end
