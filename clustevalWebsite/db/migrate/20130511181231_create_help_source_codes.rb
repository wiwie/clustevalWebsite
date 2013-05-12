class CreateHelpSourceCodes < ActiveRecord::Migration
  def change
    create_table :help_source_codes do |t|

      t.timestamps
    end
  end
end
