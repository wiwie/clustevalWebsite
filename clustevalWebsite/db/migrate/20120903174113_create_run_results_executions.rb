class CreateRunResultsExecutions < ActiveRecord::Migration
  def change
    create_table :run_results_executions do |t|

    t.integer "repository_id", :null => false
    t.integer "run_result_id", :null => false
  end

  add_index "run_results_executions", ["repository_id", "run_result_id"], :name => "index4", :unique => true
  add_index "run_results_executions", ["repository_id"], :name => "fk_runResultExecution_1"
  add_index "run_results_executions", ["run_result_id"], :name => "fk_runResultExecution_2"
  end
end
