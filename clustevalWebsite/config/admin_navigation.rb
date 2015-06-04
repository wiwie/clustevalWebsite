# -*- coding: utf-8 -*-
# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|
  # Specify a custom renderer if needed.
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # The renderer can also be specified as option in the render_navigation call.
  # navigation.renderer = Your::Custom::Renderer
  # navigation.renderer = SimpleNavigation::Renderer::Links

  # Specify the class that will be applied to active navigation items. Defaults to 'selected'
  navigation.selected_class = 'active'

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
      primary.item( :nav_mains, 'Welcome', mains_path(params[:repository])) do |sub_main|
      end
      primary.item :nav_comparison, 'Overview', url_for(:controller => 'mains', :action => 'comparison')
      primary.item( :nav_programs, 'Clustering Methods', programs_path, :highlights_on => :subpath) do |sub_programs|
        sub_programs.item :nav_programs_general, 'Overview', programs_path
        #sub_programs.item :nav_programs_comparison, 'Best Clusterings', url_for(:controller => 'programs', :action => 'comparison')
        @programs = []
        if params[:controller] == 'programs'
          if params[:action] == 'index'
            @programs = Program.all(params[:repository])
          else
            @programs = [Program.find(params[:id])]
          end
        end
        @programs.each do |program|
          sub_programs.item( :nav_program, program.name, program_path(params[:repository], program)) do |sub_program|
            sub_program.item :nav_program_general, 'General', program_path(params[:repository], program)
            sub_program.item :nav_program_performance, 'Best Qualities', url_for(:controller => 'programs', :action => 'show_performance', :id => program.id)
            sub_program.item :nav_program_bestclusterings, 'Best Parameters', url_for(:controller => 'programs', :action => 'show_bestclusterings', :id => program.id)
          end
        end
      end
      primary.item( :nav_datasets, 'Data Sets', datasets_path, :highlights_on => :subpath) do |sub_datasets|
        sub_datasets.item :nav_datasets_general, 'Overview', datasets_path
        #sub_datasets.item :nav_datasets_comparison, 'Best Clusterings', url_for(:controller => 'datasets', :action => 'comparison')
        @datasets = []
        if params[:controller] == 'datasets'
          if params[:action] == 'index'
            @datasets = Dataset.all(params[:repository])
          else
            @datasets = [Dataset.find(params[:id])]
          end
        end
        @datasets.each do |dataset|
          sub_datasets.item( :nav_dataset, dataset.name, dataset_path(params[:repository], dataset)) do |sub_dataset|
            sub_dataset.item :nav_dataset_general, 'General', dataset_path(params[:repository], dataset)
            sub_dataset.item :nav_dataset_statistics, 'Statistics', url_for(:controller => 'datasets', :action => 'show_statistics', :id => dataset.id)
            sub_dataset.item :nav_dataset_comparison, 'Best Qualities', url_for(:controller => 'datasets', :action => 'show_comparison', :id => dataset.id)
            sub_dataset.item :nav_dataset_bestclusterings, 'Best Parameters', url_for(:controller => 'datasets', :action => 'show_bestclusterings', :id => dataset.id)
            sub_dataset.item :nav_dataset_clusterings, 'All Clusterings', url_for(:controller => 'datasets', :action => 'show_clusterings', :id => dataset.id)
          end
        end
      end
    primary.item( :nav_measures, 'Measures', clustering_quality_measures_path) do |sub_measures|
      sub_measures.item :nav_measures_general, 'Overview', clustering_quality_measures_path
      @qualityMeasures = []
      if params[:controller] == 'clustering_quality_measures'
        if params[:action] == 'index'
          @qualityMeasures = ClusteringQualityMeasure.all(params[:repository]).sort_by{|x| x.alias}
        else
          @qualityMeasures = [ClusteringQualityMeasure.find(params[:id])]
        end
      end
      @qualityMeasures.each do |clustering_quality_measure|
        sub_measures.item( :nav_measure, clustering_quality_measure.alias, clustering_quality_measure_path(params[:repository], clustering_quality_measure))
      end
    end
    primary.item( :nav_submit, 'Submit', submits_path) do |sub_submit|
      sub_submit.item :nav_submit_general, 'General', submits_path
      sub_submit.item :nav_submit_dataset, 'Submit dataset', url_for(:controller => 'submit_datasets', :action => 'create')
      sub_submit.item :nav_submit_method, 'Submit method', url_for(:controller => 'submit_methods', :action => 'create')
    end
      primary.item( :nav_admins, 'Advanced', admins_path, :highlights_on => :subpath) do |sub_admin|
        sub_admin.item( :nav_program_configs, 'Clustering Method Configurations', program_configs_path) do |sub_program_configs|
          @programConfigs = []
          if params[:controller] == 'program_configs'
            if params[:action] == 'index'
              @programConfigs =ProgramConfig.all(params[:repository]).select{ |program_config| program_config.program_config_id == nil }.sort_by{|x| x.name}
            else
              @programConfigs = [ProgramConfig.find(params[:id])]
            end
          elsif params[:controller] == 'program_parameters'
            if params[:action] == 'show'
              parameter = ProgramParameter.find(params[:id])
              @programConfigs = [@programParameter.program_config]
            end
          end
          @programConfigs.each do |program_config|
            sub_program_configs.item( :nav_program_configs, program_config.name, program_config_path(params[:repository], program_config)) do |sub_program_config|
              if params[:controller] == 'program_parameters' and params[:action] == 'show'
                sub_program_config.item( :nav_program_parameters, parameter.name, program_parameter_path(params[:repository], parameter))
              end
            end
          end
        end
        sub_admin.item( :nav_data_configs, 'Data Configurations', data_configs_path) do |sub_data_configs|
          @dataConfigs = []
          if params[:controller] == 'data_configs'
            if params[:action] == 'index'
              @dataConfigs = DataConfig.all(params[:repository]).sort_by{|x| x.name}
            else
              @dataConfigs = [DataConfig.find(params[:id])]
            end
          end
          @dataConfigs.each do |data_config|
            sub_data_configs.item( :nav_data_configs, data_config.name, data_config_path(params[:repository], data_config)) do |sub_data_config|
              sub_data_config.item :nav_data_configs, 'General', data_config_path(params[:repository], data_config)
              sub_data_config.item :nav_data_configs, 'Comparison', url_for(:controller => 'data_configs', :action => 'comparison', :id => data_config)
            end
          end
        end
        sub_admin.item( :nav_dataset_configs, 'Dataset Configurations', dataset_configs_path) do |sub_dataset_configs|
          @datasetConfigs = []
          if params[:controller] == 'dataset_configs'
            if params[:action] == 'index'
              @datasetConfigs = DatasetConfig.all(params[:repository]).sort_by{|x| x.name}
            else
              @datasetConfigs = [DatasetConfig.find(params[:id])]
            end
          end
          @datasetConfigs.each do |dataset_config|
            sub_dataset_configs.item :nav_dataset_configs, dataset_config.name, dataset_config_path(params[:repository], dataset_config)
          end
        end
        sub_admin.item( :nav_gs_configs, 'Goldstandard Configurations', goldstandard_configs_path) do |sub_goldstandard_configs|
          @goldstandardConfigs = []
          if params[:controller] == 'goldstandard_configs'
            if params[:action] == 'index'
              @goldstandardConfigs = GoldstandardConfig.all(params[:repository]).sort_by{|x| x.name}
            else
              @goldstandardConfigs = [GoldstandardConfig.find_by_name(params[:id])]
            end
          end
          @goldstandardConfigs.each do |goldstandard_config|
            sub_goldstandard_configs.item :nav_goldstandard_configs, goldstandard_config.name, goldstandard_config_path(params[:repository], goldstandard_config)
          end
        end
        sub_admin.item( :nav_goldstandards, 'Gold Standards', goldstandards_path) do |sub_goldstandards|
          @goldstandards = []
          if params[:controller] == 'goldstandards'
            if params[:action] == 'index'
              @goldstandards = Goldstandard.all(params[:repository]).sort_by{|x| x.name}
            else
              @goldstandards = [Goldstandard.find(params[:id])]
            end
          end
          @goldstandards.each do |goldstandard|
            sub_goldstandards.item :nav_goldstandards, goldstandard.name, goldstandard_path(params[:repository], goldstandard)
          end
        end
        sub_admin.item( :nav_runs, 'Runs', runs_path) do |sub_runs|
          @runs = []
          if params[:controller] == 'runs' or params[:controller] == 'run_clusterings' or params[:controller] == 'run_parameter_optimizations' or params[:controller] == 'run_data_analyses' or params[:controller] == 'run_run_data_analyses'
            if params[:action] == 'index'
              @runs = Run.all(params[:repository]).sort_by{|x| x.name}
            else
              @runs = [Run.find(params[:id])]
            end
          end
          @runs.each do |run|
            @ident = run.name
            #if @ident.length > 30
            #  @ident = @ident[0..15] + "..." + @ident[@ident.length-15,@ident.length]
            #end
            @type = run.run_type
            if @type.name == "Clustering"
              run_clustering = RunClustering.find_by_run_execution_id(RunExecution.find_by_run_id(run.id))
              sub_runs.item :nav_run_clustering, @ident, run_clustering_path(params[:repository], run)
            elsif @type.name == "Parameter Optimization"
              run_paramOpt = RunParameterOptimization.find_by_run_execution_id(RunExecution.find_by_run_id(run.id))
              sub_runs.item :nav_run_paramOpt, @ident, run_parameter_optimization_path(params[:repository], run_paramOpt)
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
          @runResults = []
          if params[:controller] == 'run_results' or params[:controller] == 'run_results_clusterings' or params[:controller] == 'run_results_parameter_optimizations' or params[:controller] == 'run_results_data_analyses' or params[:controller] == 'run_results_run_data_analyses'
            if params[:action] == 'index'
              @runResults = RunResult.all(params[:repository]).uniq{|x| x.unique_run_identifier}.sort_by{|x| x.unique_run_identifier}
            else
              @runResults = [RunResult.find(params[:id])]
            end
          end
          @runResults.each do |runResult|
            @ident = runResult.unique_run_identifier
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
        sub_admin.item( :nav_runs, 'Statistics', statistics_path) do |sub_statistics|
          @statistics = []
          if params[:controller] == 'statistics'
            if params[:action] == 'index'
              @statistics = Statistic.all(params[:repository]).sort_by{|x| x.alias}
            else
              @statistics = [Statistic.find(params[:id])]
            end
          end
          @statistics.each do |statistic|
            @ident = statistic.alias
            sub_statistics.item :nav_statistic, @ident, url_for(:controller => 'statistics', :action => 'show', :id => statistic, :only_path => true)
          end
        end
      end
      primary.item( :nav_helps, 'Help', helps_path) do |sub_help|
        sub_help.item :nav_help_installation, 'Download & Installation', help_installations_path
        sub_help.item :nav_help_tec_doc, 'Technical Documentation', help_technical_documentations_path
        sub_help.item :nav_help_source_code, 'Source Code', help_source_codes_path
        sub_help.item :nav_help_publication, 'Publications', help_publications_path
      end
      primary.item( :nav_aboutus, 'About us', aboutus_path) do |sub_aboutus|
        sub_aboutus.item( :nav_impressum, 'Impressum', aboutus_impressums_path)
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
    primary.dom_class = 'nav'

    # You can turn off auto highlighting for a specific level
    # primary.auto_highlight = false

  end

end
