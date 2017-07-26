class CreateClustevalFlags < ActiveRecord::Migration
  def up
    create_table :clusteval_flags do |t|
    	t.string 'key',        :limit => 767, :null => false
    	t.binary 'value',      :limit => 767
    end
  end

  def down
    drop_table :clusteval_flags
  end
end
