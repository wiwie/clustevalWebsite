class AddVisibilityToDatasets < ActiveRecord::Migration
  def change
    add_column :datasets, :visibility, :integer
  end
end
