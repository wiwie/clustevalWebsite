ClustEval::Application.routes.draw do
  get "user_sessions/new"

  	mathjax 'mathjax'

  	match 'datasets/index' => 'datasets#index'
  	match 'datasets/comparison' => 'datasets#comparison'
  	match 'datasets/show_comparison' => 'datasets#show_comparison'
	match 'datasets/fetch_table_data/:id/:measureId' => 'datasets#fetch_table_data'
	match 'datasets/download/:id' => 'datasets#download'
	match 'datasets/:id/perf' => 'datasets#show_performance'
	match 'datasets/:id/stat' => 'datasets#show_statistics'
	match 'datasets/:id/clust' => 'datasets#show_clusterings'
	match 'datasets/:id/bestclust' => 'datasets#show_bestclusterings'
	match 'datasets/:id/bestclust/:program_filter' => 'datasets#show_bestclusterings', :as => :dataset_filter
	match 'data_configs/fetch_table_data/:id' => 'data_configs#fetch_table_data'
	match 'data_configs/:id/comparison' => 'data_configs#comparison'
	match 'login', :to => "user_sessions#new",      :as => :login
	match 'logout', :to => "user_sessions#destroy", :as => :logout
	match 'mains' => 'mains#set_user_session_repository', :via => :post
	match 'mains/comparison' => 'mains#comparison'
	match 'mains/tableHeaderImage/:text' => 'mains#tableHeaderImage'
	match 'program_configs/fetch_table_data/:id' => 'program_configs#fetch_table_data'
	match 'programs/download/:id' => 'programs#download'
  	match 'programs/index' => 'programs#index'
  	match 'programs/comparison' => 'programs#comparison'
	match 'programs/:id/perf' => 'programs#show_performance'
	match 'programs/:id/clust' => 'programs#show_bestclusterings'
	match 'programs/:id/clust/:dataset_filter' => 'programs#show_bestclusterings', :as => :program_filter
	match 'run_results_parameter_optimizations/img/:id' => 'run_results_parameter_optimizations#img'
	match 'run_results_parameter_optimizations/fetch_table_data/:id/:dataId/:programId' => 'run_results_parameter_optimizations#fetch_table_data'
	match 'run_results_parameter_optimizations/fetch_graph_data/:id/:dataId/:programId' => 'run_results_parameter_optimizations#fetch_graph_data'
	match 'run_results_parameter_optimizations_parameter_set_iterations/img/:id' => 'run_results_parameter_optimizations_parameter_set_iterations#img'
	match 'run_results_parameter_optimizations_parameter_set_iterations/isoMDS/:id' => 'run_results_parameter_optimizations_parameter_set_iterations#isoMDS'
	match 'run_results_parameter_optimizations_parameter_set_iterations/pca/:id' => 'run_results_parameter_optimizations_parameter_set_iterations#pca'

	match 'run_results_run_analyses/img/:runIdentifier/:statisticName/:id' => 'run_results_run_analyses#img'
	match 'runs/start/:id' => 'runs#start'
	match 'runs/stop/:id' => 'runs#stop'
	match 'small_rankings/dsp/:qualityMeasure/:inv' => 'small_rankings#dsp'
	match 'small_rankings/ds/:id/:qualityMeasure' => 'small_rankings#ds'
	match 'small_rankings/p/:id/:qualityMeasure' => 'small_rankings#p'

	resources :admins
	resources :datasets
	resources :dataset_formats
	resources :data_configs
	resources :dataset_configs
	resources :executables
	resources :goldstandards
	resources :goldstandard_configs
	resources :mains
	resources :helps
	resources :help_installations
	resources :help_technical_documentations
	resources :help_source_codes
	resources :aboutus
	resources :parameter_optimization_methods
	resources :programs
	resources :program_configs
	resources :program_parameters
	resources :program_parameter_types
	resources :clustering_quality_measures
	resources :repositories
	resources :repository_types
	resources :runs
	resources :run_analyses
	resources :run_analysis_statistics
	resources :run_executions
	resources :run_clusterings
	resources :run_parameter_optimizations
	resources :run_parameter_optimization_methods
	resources :run_parameter_optimization_parameters
	resources :run_internal_parameter_optimizations
	resources :run_data_analyses
	resources :run_data_analyses_data_configs
	resources :run_run_analyses
	resources :run_run_data_analyses
	resources :run_run_data_analysis_data_identifiers
	resources :run_results
	resources :run_results_executions
	resources :run_results_clusterings
	resources :run_results_parameter_optimizations
	resources :run_results_parameter_optimizations_parameter_set_parameters
	resources :run_results_parameter_optimizations_parameter_set_iterations
	resources :run_results_parameter_optimizations_parameter_sets
	resources :run_results_parameter_optimizations_parameter_values
	resources :run_results_parameter_optimizations_qualities
	resources :run_results_internal_parameter_optimizations
	resources :run_results_analyses
	resources :run_results_data_analyses
	resources :run_results_run_analyses
	resources :run_results_run_data_analyses
	resources :run_result_formats
	resources :statistics
	resources :statistics_datas
	resources :statistics_runs
	resources :statistics_run_datas
	resources :view_runs
	resources :small_rankings
	resources :submits
	resources :submit_datasets
	resources :submit_methods
	resources :users
	resources :user_sessions
	resource :account, :controller => "users"
	root :to => 'mains#index' #RAILS 3
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
