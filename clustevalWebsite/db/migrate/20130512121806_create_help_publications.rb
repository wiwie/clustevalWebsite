class CreateHelpPublications < ActiveRecord::Migration
  def change
    create_table :help_publications do |t|

      t.timestamps
    end
  end
end
