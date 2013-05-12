class CreateRunResultsClusteringQualities < ActiveRecord::Migration
  def change
    create_table :run_results_clustering_qualities do |t|

      t.integer "repository_id",                           :null => false
      t.integer "run_results_clustering_id",                :null => false
      t.integer "data_config_id",                :null => false
      t.integer "program_config_id",                :null => false
      t.integer "clustering_quality_measure_id",                :null => false
      t.binary "paramString", :null => false
      t.binary "quality",                :null => false
    end

  add_index "run_results_clustering_qualities", ["repository_id"], :name => "fk_run_results_clustering_qualities_1"
  add_index "run_results_clustering_qualities", ["repository_id", "run_results_clustering_id", "data_config_id", "program_config_id", "clustering_quality_measure_id"], :name => "fk_run_results_clustering_qualities_2", :unique => true

  add_foreign_key "run_results_clustering_qualities", "repositories", :name => "fk_clustering_qualities_repositories", dependent: :delete
  add_foreign_key "run_results_clustering_qualities", "run_results_clusterings", :name => "fk_clustering_quals_run_results_clusterings", dependent: :delete
  add_foreign_key "run_results_clustering_qualities", "data_configs", :name => "fk_clustering_qualities_data_configs", dependent: :delete
  add_foreign_key "run_results_clustering_qualities", "program_configs", :name => "fk_clustering_qualities_program_configs", dependent: :delete
  add_foreign_key "run_results_clustering_qualities", "clustering_quality_measures", :name => "fk_clustering_quals_qual_measures", dependent: :delete
  end
end
