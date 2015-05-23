class CreateProgramImages < ActiveRecord::Migration
  def change
    create_table :program_images do |t|
    	t.binary 'program_fullName',   :limit => 767, :null => false
    	t.binary 'program_imageUrl',   :limit => 500, :null => false
    end

    add_index "program_images", ["program_fullName"], :name => "fk_program_images_1", :unique => true, :length => {"program_fullName" => 767}
  end
end
