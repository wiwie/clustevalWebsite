class CreateRunConfigsExecutions < ActiveRecord::Migration
  def change
    create_table :run_executions do |t|

    t.integer "repository_id", :null => false
    t.integer "run_id",        :null => false
  end

  add_index "run_executions", ["repository_id"], :name => "fk_runConfigsExecution_2"
  add_index "run_executions", ["run_id", "repository_id"], :name => "run_id_UNIQUE", :unique => true
  add_index "run_executions", ["run_id"], :name => "fk_runConfigsExecution_1"
  end
end
