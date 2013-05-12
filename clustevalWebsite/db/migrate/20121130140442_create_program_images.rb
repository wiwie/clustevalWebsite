class CreateProgramImages < ActiveRecord::Migration
  def change
    create_table :program_images do |t|
    	t.string 'program_fullName',   :limit => 200, :null => false
    	t.string 'program_imageUrl',   :limit => 500, :null => false
    end

    add_index "program_images", ["program_fullName"], :name => "fk_program_images_1", :unique => true
  end
end
