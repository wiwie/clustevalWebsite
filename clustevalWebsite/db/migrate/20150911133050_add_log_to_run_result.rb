class AddLogToRunResult < ActiveRecord::Migration
  def change
    add_column :run_results, :log, :string
  end
end
