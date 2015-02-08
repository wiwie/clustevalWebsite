class CreateDatasetVisibilities < ActiveRecord::Migration
  def change
    create_table :dataset_visibilities do |t|
      t.string :dataset_name
      t.boolean :visible

      t.timestamps
    end
  end
end
