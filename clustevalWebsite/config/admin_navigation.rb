# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Specify a custom renderer if needed.
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # The renderer can also be specified as option in the render_navigation call.
  # navigation.renderer = Your::Custom::Renderer
  # navigation.renderer = SimpleNavigation::Renderer::Links

  # Specify the class that will be applied to active navigation items. Defaults to 'selected'
  # navigation.selected_class = 'your_selected_class'

  # Specify the class that will be applied to the current leaf of
  # active navigation items. Defaults to 'simple-navigation-active-leaf'
  # navigation.active_leaf_class = 'your_active_leaf_class'

  # Item keys are normally added to list items as id.
  # This setting turns that off
  # navigation.autogenerate_item_ids = false

  # You can override the default logic that is used to autogenerate the item ids.
  # To do this, define a Proc which takes the key of the current item as argument.
  # The example below would add a prefix to each key.
  # navigation.id_generator = Proc.new {|key| "my-prefix-#{key}"}

  # If you need to add custom html around item names, you can define a proc that will be called with the name you pass in to the navigation.
  # The example below shows how to wrap items spans.
  # navigation.name_generator = Proc.new {|name| "<span>#{name}</span>"}

  # The auto highlight feature is turned on by default.
  # This turns it off globally (for the whole plugin)
  # navigation.auto_highlight = false

  # Define the primary navigation
  navigation.items do |primary|
    # Add an item to the primary navigation. The following params apply:
    # key - a symbol which uniquely defines your navigation item in the scope of the primary_navigation
    # name - will be displayed in the rendered navigation. This can also be a call to your I18n-framework.
    # url - the address that the generated item links to. You can also use url_helpers (named routes, restful routes helper, url_for etc.)
    # options - can be used to specify attributes that will be included in the rendered navigation item (e.g. id, class etc.)
    #           some special options that can be set:
    #           :if - Specifies a proc to call to determine if the item should
    #                 be rendered (e.g. <tt>:if => Proc.new { current_user.admin? }</tt>). The
    #                 proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :unless - Specifies a proc to call to determine if the item should not
    #                     be rendered (e.g. <tt>:unless => Proc.new { current_user.admin? }</tt>). The
    #                     proc should evaluate to a true or false value and is evaluated in the context of the view.
    #           :method - Specifies the http-method for the generated link - default is :get.
    #           :highlights_on - if autohighlighting is turned off and/or you want to explicitly specify
    #                            when the item should be highlighted, you can set a regexp which is matched
    #                            against the current URI.  You may also use a proc, or the symbol <tt>:subpath</tt>. 
    #

    # navigation if logged in
    # if false
    #   primary.item :nav_mains, 'Start', root_path
    #   primary.item( :nav_run, 'Run', runs_path, :highlights_on => :subpath) do |sub_runs|
    #     sub_runs.item :nav_runs, 'Runs', runs_path, :highlights_on => :subpath
  	 #    sub_runs.item :nav_run_configs, 'Run Configs', run_configs_path, :highlights_on => :subpath
    #   end
    #   primary.item( :nav_program, 'Clustering Method', program_configs_path, :highlights_on => :subpath) do |sub_programConfigs|
    #     sub_programConfigs.item :nav_program_configs, 'Clustering Method Configs', program_configs_path, :highlights_on => :subpath
  	 #    sub_programConfigs.item :nav_programs, 'Clustering Methods', programs_path, :highlights_on => :subpath
    #   end
    #   primary.item( :nav_data, 'Data', data_configs_path, :highlights_on => :subpath) do |sub_dataconfigs|
    #     sub_dataconfigs.item :nav_dataconfigs, 'Data Configs', data_configs_path, :highlights_on => :subpath
    #   	sub_dataconfigs.item :nav_dataset_configs, 'Dataset Configs', dataset_configs_path, :highlights_on => :subpath
    #   	sub_dataconfigs.item :nav_datasets, 'Datasets', datasets_path, :highlights_on => :subpath
    #   	sub_dataconfigs.item :nav_goldstandard_configs, 'Goldstandard Configs', goldstandard_configs_path, :highlights_on => :subpath
    #   	sub_dataconfigs.item :nav_goldstandards, 'Goldstandards', goldstandards_path, :highlights_on => :subpath
    #   end
    #   primary.item( :nav_result, 'Results', run_results_path, :highlights_on => :subpath) do |sub_results|
    #     sub_results.item :nav_runresults, 'Run Results', run_results_path, :highlights_on => :subpath
    #   end
    # # navigation if logged out
    # else
      primary.item( :nav_mains, 'Welcome', root_path) do |sub_main|
      end
      primary.item :nav_comparison, 'Overview', url_for(:controller => 'mains', :action => 'comparison')
      primary.item( :nav_programs, 'Clustering Methods', programs_path, :highlights_on => :subpath) do |sub_programs|
        sub_programs.item :nav_programs_general, 'Overview', programs_path
        sub_programs.item :nav_programs_comparison, 'Comparison', url_for(:controller => 'programs', :action => 'comparison')
        Program.all(session).each do |program|
          sub_programs.item( :nav_program, program.name, program_path(program)) do |sub_program|
            sub_program.item :nav_program_general, 'General', program_path(program)
            sub_program.item :nav_program_performance, 'Performance', url_for(:controller => 'programs', :action => 'show_performance', :id => program.id)
            sub_program.item :nav_program_bestclusterings, 'Best Clusterings', url_for(:controller => 'programs', :action => 'show_bestclusterings', :id => program.id)
          end
        end
      end
      primary.item( :nav_datasets, 'Data Sets', datasets_path, :highlights_on => :subpath) do |sub_datasets|
        sub_datasets.item :nav_datasets_general, 'Overview', datasets_path
        sub_datasets.item :nav_datasets_comparison, 'Comparison', url_for(:controller => 'datasets', :action => 'comparison')
        Dataset.all(session).each do |dataset|
          sub_datasets.item( :nav_dataset, dataset.name, dataset_path(dataset)) do |sub_dataset|
            sub_dataset.item :nav_dataset_general, 'General', dataset_path(dataset)
            sub_dataset.item :nav_dataset_statistics, 'Statistics', url_for(:controller => 'datasets', :action => 'show_statistics', :id => dataset.id)
            sub_dataset.item :nav_dataset_comparison, 'Comparison', url_for(:controller => 'datasets', :action => 'show_comparison', :id => dataset.id)
            sub_dataset.item :nav_dataset_bestclusterings, 'Best Clusterings', url_for(:controller => 'datasets', :action => 'show_bestclusterings', :id => dataset.id)
            sub_dataset.item :nav_dataset_clusterings, 'Clusterings', url_for(:controller => 'datasets', :action => 'show_clusterings', :id => dataset.id)
          end
        end
      end
    primary.item( :nav_measures, 'Measures', clustering_quality_measures_path) do |sub_measures|
      ClusteringQualityMeasure.all(session).sort_by{|x| x.alias}.each do |clustering_quality_measure|
        sub_measures.item( :nav_measure, clustering_quality_measure.alias, clustering_quality_measure_path(clustering_quality_measure))
      end
    end
    primary.item( :nav_submit, 'Submit', submits_path) do |sub_submit|
      sub_submit.item :nav_submit_general, 'General', submits_path
      sub_submit.item :nav_submit_dataset, 'Submit dataset', url_for(:controller => 'submit_datasets', :action => 'create')
      sub_submit.item :nav_submit_method, 'Submit method', url_for(:controller => 'submit_methods', :action => 'create')
    end
      primary.item( :nav_admins, 'Admin', admins_path, :highlights_on => :subpath) do |sub_admin|
        sub_admin.item( :nav_program_configs, 'Clustering Method Configurations', program_configs_path) do |sub_program_configs|
          ProgramConfig.all(session).sort_by{|x| x.name}.each do |program_config|
            sub_program_configs.item :nav_program_configs, program_config.name, program_config_path(program_config)
          end
        end
        sub_admin.item( :nav_data_configs, 'Data Configurations', data_configs_path) do |sub_data_configs|
          DataConfig.all(session).sort_by{|x| x.name}.each do |data_config|
            sub_data_configs.item( :nav_data_configs, data_config.name, data_config_path(data_config)) do |sub_data_config|
              sub_data_config.item :nav_data_configs, 'General', data_config_path(data_config)
              sub_data_config.item :nav_data_configs, 'Comparison', url_for(:controller => 'data_configs', :action => 'comparison', :id => data_config.name)
            end
          end
        end
        sub_admin.item( :nav_dataset_configs, 'Dataset Configurations', dataset_configs_path) do |sub_dataset_configs|
          DatasetConfig.all(session).sort_by{|x| x.name}.each do |dataset_config|
            sub_dataset_configs.item :nav_dataset_configs, dataset_config.name, dataset_config_path(dataset_config)
          end
        end
        sub_admin.item( :nav_gs_configs, 'Goldstandard Configurations', goldstandard_configs_path) do |sub_goldstandard_configs|
          GoldstandardConfig.all(session).sort_by{|x| x.name}.each do |goldstandard_config|
            sub_goldstandard_configs.item :nav_goldstandard_configs, goldstandard_config.name, goldstandard_config_path(goldstandard_config)
          end
        end
        sub_admin.item( :nav_goldstandards, 'Gold Standards', goldstandards_path) do |sub_goldstandards|
          Goldstandard.all(session).sort_by{|x| x.name}.each do |goldstandard|
            sub_goldstandards.item :nav_goldstandards, goldstandard.name, goldstandard_path(goldstandard)
          end
        end
        sub_admin.item( :nav_runs, 'Runs', runs_path) do |sub_runs|
          Run.all(session).sort_by{|x| x.name}.each do |run|
            @ident = run.name
            #if @ident.length > 30
            #  @ident = @ident[0..15] + "..." + @ident[@ident.length-15,@ident.length]
            #end
            @type = run.run_type
            if @type.name == "Clustering"
              run_clustering = RunClustering.find_by_run_execution_id(RunExecution.find_by_run_id(run.id))
              sub_runs.item :nav_run_clustering, @ident, run_clustering_path(run)
            elsif @type.name == "Parameter Optimization"
              run_paramOpt = RunParameterOptimization.find_by_run_execution_id(RunExecution.find_by_run_id(run.id))
              sub_runs.item :nav_run_paramOpt, @ident, run_parameter_optimization_path(run_paramOpt)
            elsif @type.name == "Data Analysis"
              run_dataAnalysis = RunDataAnalysis.find_by_run_analysis_id(RunAnalysis.find_by_run_id(run.id))
              sub_runs.item :nav_run_dataAnalysis, @ident, url_for(:controller => 'run_data_analyses', :action => 'show', :id => run_dataAnalysis, :only_path => true)
            elsif @type.name == "Run Analysis"
              run_runAnalysis = RunRunAnalysis.find_by_run_analysis_id(RunAnalysis.find_by_run_id(run.id))
              sub_runs.item :nav_run_runAnalysis, @ident, url_for(:controller => 'run_run_analyses', :action => 'show', :id => run_runAnalysis, :only_path => true)
            elsif @type.name == "Run-Data Analysis"
              run_runDataAnalysis = RunRunDataAnalysis.find_by_run_analysis_id(RunAnalysis.find_by_run_id(run.id))
              sub_runs.item :nav_run_runDataAnalysis, @ident, url_for(:controller => 'run_run_data_analyses', :action => 'show', :id => run_runDataAnalysis, :only_path => true)
            end
          end
        end
        sub_admin.item( :nav_run_results, 'Results', run_results_path) do |sub_run_results|
          RunResult.all(session).uniq{|x| x.uniqueRunIdentifier}.sort_by{|x| x.uniqueRunIdentifier}.each do |runResult|
            @ident = runResult.uniqueRunIdentifier
            #if @ident.length > 30
            #  @ident = @ident[0..15] + "..." + @ident[@ident.length-15,@ident.length]
            #end
             @type = runResult.run_type
            if @type.name == "Clustering"
              sub_run_results.item :nav_runresult_clustering, @ident, url_for(:controller => 'run_results_clusterings', :action => 'show', :id => runResult, :only_path => true)
            elsif @type.name == "Parameter Optimization"
              sub_run_results.item :nav_runresult_paramopt, @ident, url_for(:controller => 'run_results_parameter_optimizations', :action => 'show', :id => runResult, :only_path => true)
            elsif @type.name == "Data Analysis"
              sub_run_results.item :nav_runresult_dataanalysis, @ident, url_for(:controller => 'run_results_data_analyses', :action => 'show', :id => runResult, :only_path => true)
            elsif @type.name == "Run Analysis"
              sub_run_results.item :nav_runresult_runanalysis, @ident, url_for(:controller => 'run_results_run_analyses', :action => 'show', :id => runResult, :only_path => true)
            elsif @type.name == "Run-Data Analysis"
              sub_run_results.item :nav_runresult_rundataanalysis, @ident, url_for(:controller => 'run_results_run_data_analyses', :action => 'show', :id => runResult, :only_path => true)
            end
          end
        end
      end
      primary.item( :nav_helps, 'Help', helps_path) do |sub_help|
        sub_help.item :nav_help_installation, 'Download & Installation', help_installations_path
        sub_help.item :nav_help_tec_doc, 'Technical Documentation', help_technical_documentations_path
        sub_help.item :nav_help_source_code, 'Source Code', help_source_codes_path
      end
      primary.item( :nav_aboutus, 'About us', aboutus_path) do |sub_aboutus|
      end
    #end

    # Add an item which has a sub navigation (same params, but with block)
    #primary.item :key_2, 'name', url, options do |sub_nav|
      # Add an item to the sub navigation (same params again)
    #  sub_nav.item :key_2_1, 'name', url, options
    #end

    # You can also specify a condition-proc that needs to be fullfilled to display an item.
    # Conditions are part of the options. They are evaluated in the context of the views,
    # thus you can use all the methods and vars you have available in the views.
    #primary.item :key_3, 'Admin', url, :class => 'special', :if => Proc.new { current_user.admin? }
    #primary.item :key_4, 'Account', url, :unless => Proc.new { logged_in? }

    # you can also specify a css id or class to attach to this particular level
    # works for all levels of the menu
    # primary.dom_id = 'menu-id'
    primary.dom_class = 'dom_class'

    # You can turn off auto highlighting for a specific level
    # primary.auto_highlight = false

  end

end
