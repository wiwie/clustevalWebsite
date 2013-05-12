class CreateHelpTechnicalDocumentations < ActiveRecord::Migration
  def change
    create_table :help_technical_documentations do |t|

      t.timestamps
    end
  end
end
