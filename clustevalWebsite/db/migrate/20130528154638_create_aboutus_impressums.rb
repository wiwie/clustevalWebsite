class CreateAboutusImpressums < ActiveRecord::Migration
  def change
    create_table :aboutus_impressums do |t|

      t.timestamps
    end
  end
end
