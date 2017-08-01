ClustEval::Application.routes.draw do
	root :to => 'mains#index' #RAILS 3
	mathjax 'mathjax'

	scope ':repository' do
	  	get 'datasets/index' => 'datasets#index'
	  	get 'datasets/comparison' => 'datasets#comparison'
	  	get 'datasets/show_comparison' => 'datasets#show_comparison'
		get 'datasets/fetch_table_data/:id/:measureId' => 'datasets#fetch_table_data'
		get 'datasets/show_clusterings_fetch_graph_data/:id/:measureId' => 'datasets#show_clusterings_fetch_graph_data'
		get 'datasets/bestclusterings_table_data/:id/:measureId' => 'datasets#bestclusterings_table_data'
		get 'datasets/download/:id' => 'datasets#download'
		get 'datasets/:id/perf' => 'datasets#show_performance'
		get 'datasets/:id/stat' => 'datasets#show_statistics'
		get 'datasets/:id/clust' => 'datasets#show_clusterings'
		get 'datasets/:id/bestclust' => 'datasets#show_bestclusterings'
		get 'datasets/:id/bestclust/:program_filter' => 'datasets#show_bestclusterings', :as => :dataset_filter
		get 'datasets/:id/tooltip_info' => 'datasets#tooltip_info'
		get 'data_configs/fetch_table_data/:id' => 'data_configs#fetch_table_data'
		get 'data_configs/:id/comparison' => 'data_configs#comparison'
		get 'login', :to => "user_sessions#new",      :as => :login
		get 'logout', :to => "user_sessions#destroy", :as => :logout
		get 'mains' => 'mains#index', :via => :post
		get 'mains/comparison' => 'mains#comparison'
		post 'mains/comparison' => 'mains#comparison'
		get 'mains/workflow' => 'mains#workflow'
		get 'mains/comparison_table_data/:qualityMeasure' => 'mains#comparison_table_data'
		get 'mains/comparison_table_data_inverse/:qualityMeasure' => 'mains#comparison_table_data_inverse'
		get 'mains/tableHeaderImage/:text' => 'mains#tableHeaderImage'
		get 'program_configs/fetch_table_data/:id' => 'program_configs#fetch_table_data'
		get 'programs/download/:id' => 'programs#download'
	  	get 'programs/comparison' => 'programs#comparison'
		get 'programs/:id/perf' => 'programs#show_performance'
		get 'programs/:id/clust' => 'programs#show_bestclusterings'
		get 'programs/:id/clust/:dataset_filter' => 'programs#show_bestclusterings', :as => :program_filter
		get 'programs/:id/tooltip_info' => 'programs#tooltip_info'
		get 'run_results_parameter_optimizations/img/:id' => 'run_results_parameter_optimizations#img'
		get 'run_results_parameter_optimizations/fetch_table_data/:id/:dataId/:programId' => 'run_results_parameter_optimizations#fetch_table_data'
		get 'run_results_parameter_optimizations/fetch_graph_data/:id/:dataId/:programId/:paramName' => 'run_results_parameter_optimizations#fetch_graph_data'
		get 'run_results_parameter_optimizations_parameter_set_iterations/img/:id' => 'run_results_parameter_optimizations_parameter_set_iterations#img'
		get 'run_results_parameter_optimizations_parameter_set_iterations/isoMDS/:id' => 'run_results_parameter_optimizations_parameter_set_iterations#isoMDS'
		get 'run_results_parameter_optimizations_parameter_set_iterations/pca/:id' => 'run_results_parameter_optimizations_parameter_set_iterations#pca'
		get 'run_results_parameter_optimizations_parameter_set_iterations/:id/tooltip_info' => 'run_results_parameter_optimizations_parameter_set_iterations#tooltip_info'
		get 'run_results/find_by_name' => 'run_results#find_by_name'

		get 'run_results_run_analyses/img/:runIdentifier/:statisticName/:id' => 'run_results_run_analyses#img'
		get 'runs/start/:id' => 'runs#start'
		get 'runs/stop/:id' => 'runs#stop'
		get 'small_rankings/dsp/:qualityMeasure/:inv' => 'small_rankings#dsp'
		get 'small_rankings/ds/:id/:qualityMeasure' => 'small_rankings#ds'
		get 'small_rankings/p/:id/:qualityMeasure' => 'small_rankings#p'

		get 'clustering_quality_measures/:id/tooltip_info' => 'clustering_quality_measures#tooltip_info'

		get 'clustering_quality_measures/:id/histogram' => 'clustering_quality_measures#histogram'
		get 'clustering_quality_measures/correlations' => 'clustering_quality_measures#correlations'

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
		resources :help_publications
		resources :help_source_codes
		resources :aboutus
		resources :aboutus_impressums
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
		resources :statistics_data
		resources :statistics_runs
		resources :statistics_run_data
		resources :view_runs
		resources :small_rankings
		resources :submits
		resources :submit_datasets
		resources :submit_methods
		resources :users
	  # The priority is based upon order of creation:
	  # first created -> highest priority.

	  # Sample of regular route:
	  #   get 'products/:id' => 'catalog#view'
	  # Keep in mind you can assign values other than :controller and :action

	  # Sample of named route:
	  #   get 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
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
	  # get ':controller(/:action(/:id))(.:format)'
	end
end
