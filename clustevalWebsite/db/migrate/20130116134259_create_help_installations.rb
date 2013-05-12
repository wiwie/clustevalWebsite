class CreateHelpInstallations < ActiveRecord::Migration
  def change
    create_table :help_installations do |t|

      t.timestamps
    end
  end
end
