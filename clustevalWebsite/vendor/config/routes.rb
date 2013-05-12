ClustEval::Application.routes.draw do
	resources :datasets
	resources :dataset_formats
	resources :data_configs
	resources :dataset_configs
	resources :executables
	resources :goldstandards
	resources :goldstandard_configs
	resources :mains
	resources :parameter_optimization_methods
	resources :programs
	resources :program_configs
	resources :program_parameters
	resources :program_parameter_types
	resources :clustering_quality_measures
	resources :repositories
	resources :repository_types
	resources :runs
	resources :run_configs
	resources :run_configs_analyses
	resources :run_configs_analysis_statistics
	resources :run_configs_executions
	resources :run_configs_clusterings
	resources :run_configs_parameter_optimizations
	resources :run_configs_parameter_optimization_methods
	resources :run_configs_parameter_optimization_parameters
	resources :run_configs_internal_parameter_optimizations
	resources :run_configs_data_analyses
	resources :run_configs_data_analyses_data_configs
	resources :run_configs_run_analyses
	resources :run_configs_run_data_analyses
	resources :run_configs_run_data_analysis_data_identifiers
	resources :run_results
	resources :run_results_executions
	resources :run_results_clusterings
	resources :run_results_parameter_optimizations
	resources :run_results_parameter_optimizations_parameter_set_parameters
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
	match 'run_results_parameter_optimizations/img/:id' => 'run_results_parameter_optimizations#img'
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
