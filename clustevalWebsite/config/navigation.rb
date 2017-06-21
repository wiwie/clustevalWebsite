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

    primary.item( :nav_mains, 'Welcome', root_path) do |sub_main|
    end
    primary.item :nav_comparison, 'Overview', url_for(:controller => 'mains', :action => 'comparison')
    primary.item( :nav_programs, 'Clustering Methods', programs_path, :highlights_on => :subpath) do |sub_programs|
      sub_programs.item :nav_programs_general, 'Overview', programs_path
      sub_programs.item :nav_programs_comparison, 'Comparison', url_for(:controller => 'programs', :action => 'comparison')
      Program.all(params[:repository]).each do |program|
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
      Dataset.all(params[:repository]).each do |dataset|
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
      sub_measures.item( :nav_measures_corrs, 'Correlations', url_for(:controller => 'clustering_quality_measures', :action => 'correlations'))
      ClusteringQualityMeasure.all(params[:repository]).sort_by{|x| x.alias}.each do |clustering_quality_measure|
        sub_measures.item( :nav_measure, clustering_quality_measure.alias, clustering_quality_measure_path(clustering_quality_measure)) do |sub_measure|
	 sub_measure.item :nav_measure_general, 'General', clustering_quality_measure_path(clustering_quality_measure)
	 sub_measure.item :nav_measure_histogram, 'Histogram', url_for(:controller => 'clustering_quality_measures', :action => 'histogram', :id => clustering_quality_measure.id)
	end
      end
    end
    primary.item( :nav_submit, 'Submit', submits_path) do |sub_submit|
      sub_submit.item :nav_submit_general, 'General', submits_path
      sub_submit.item :nav_submit_dataset, 'Submit dataset', url_for(:controller => 'submit_datasets', :action => 'create')
      sub_submit.item :nav_submit_method, 'Submit method', url_for(:controller => 'submit_methods', :action => 'create')
    end
    primary.item( :nav_helps, 'Help', helps_path) do |sub_help|
      #sub_help.item :nav_help_installation, 'Download & Installation', help_installations_path
      #sub_help.item :nav_help_tec_doc, 'Technical Documentation', help_technical_documentations_path
      #sub_help.item :nav_help_source_code, 'Source Code', help_source_codes_path
      sub_help.item :nav_help_publication, 'Publications', help_publications_path
    end
    primary.item( :nav_aboutus, 'About us', aboutus_path) do |sub_aboutus|
    end

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
    primary.dom_class = 'nav nav-tabs'

    # You can turn off auto highlighting for a specific level
    # primary.auto_highlight = false

  end

end
