class CreateRunConfigsAnalyses < ActiveRecord::Migration
  def change
    create_table :run_analyses do |t|

    t.integer "repository_id", :null => false
    t.integer "run_id",        :null => false
  end

  add_index "run_analyses", ["repository_id", "run_id"], :name => "index4", :unique => true
  add_index "run_analyses", ["repository_id"], :name => "fk_runConfigsAnalysis_1"
  add_index "run_analyses", ["run_id"], :name => "fk_runConfigsAnalysis_2"
  end
end
