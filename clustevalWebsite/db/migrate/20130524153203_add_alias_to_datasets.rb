class AddAliasToDatasets < ActiveRecord::Migration
  def change
    add_column :datasets, :alias, :string,                           :null => false
  end
end
