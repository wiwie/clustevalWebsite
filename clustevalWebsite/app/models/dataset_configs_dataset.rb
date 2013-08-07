class DatasetConfigsDataset < ActiveRecord::Base
  belongs_to :dataset
  belongs_to :dataset_config
end
