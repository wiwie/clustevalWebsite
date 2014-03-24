# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sass}
  s.version = "3.2.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nathan Weizenbaum", "Chris Eppstein", "Hampton Catlin"]
  s.date = %q{2013-02-23}
  s.description = %q{      Sass makes CSS fun again. Sass is an extension of CSS3, adding
      nested rules, variables, mixins, selector inheritance, and more.
      It's translated to well-formatted, standard CSS using the
      command line tool or a web-framework plugin.
}
  s.email = %q{sass-lang@googlegroups.com}
  s.executables = ["sass", "sass-convert", "scss"]
  s.files = ["rails/init.rb", "lib/sass.rb", "lib/sass/cache_stores.rb", "lib/sass/plugin/compiler.rb", "lib/sass/plugin/merb.rb", "lib/sass/plugin/staleness_checker.rb", "lib/sass/plugin/rack.rb", "lib/sass/plugin/rails.rb", "lib/sass/plugin/configuration.rb", "lib/sass/plugin/generic.rb", "lib/sass/version.rb", "lib/sass/supports.rb", "lib/sass/media.rb", "lib/sass/cache_stores/chain.rb", "lib/sass/cache_stores/memory.rb", "lib/sass/cache_stores/null.rb", "lib/sass/cache_stores/filesystem.rb", "lib/sass/cache_stores/base.rb", "lib/sass/shared.rb", "lib/sass/repl.rb", "lib/sass/error.rb", "lib/sass/tree/import_node.rb", "lib/sass/tree/trace_node.rb", "lib/sass/tree/return_node.rb", "lib/sass/tree/root_node.rb", "lib/sass/tree/if_node.rb", "lib/sass/tree/charset_node.rb", "lib/sass/tree/css_import_node.rb", "lib/sass/tree/function_node.rb", "lib/sass/tree/media_node.rb", "lib/sass/tree/while_node.rb", "lib/sass/tree/for_node.rb", "lib/sass/tree/directive_node.rb", "lib/sass/tree/rule_node.rb", "lib/sass/tree/each_node.rb", "lib/sass/tree/node.rb", "lib/sass/tree/mixin_node.rb", "lib/sass/tree/extend_node.rb", "lib/sass/tree/mixin_def_node.rb", "lib/sass/tree/supports_node.rb", "lib/sass/tree/visitors/perform.rb", "lib/sass/tree/visitors/to_css.rb", "lib/sass/tree/visitors/check_nesting.rb", "lib/sass/tree/visitors/deep_copy.rb", "lib/sass/tree/visitors/extend.rb", "lib/sass/tree/visitors/set_options.rb", "lib/sass/tree/visitors/cssize.rb", "lib/sass/tree/visitors/convert.rb", "lib/sass/tree/visitors/base.rb", "lib/sass/tree/content_node.rb", "lib/sass/tree/comment_node.rb", "lib/sass/tree/warn_node.rb", "lib/sass/tree/debug_node.rb", "lib/sass/tree/prop_node.rb", "lib/sass/tree/variable_node.rb", "lib/sass/engine.rb", "lib/sass/plugin.rb", "lib/sass/root.rb", "lib/sass/importers.rb", "lib/sass/logger.rb", "lib/sass/util/multibyte_string_scanner.rb", "lib/sass/util/subset_map.rb", "lib/sass/scss.rb", "lib/sass/scss/static_parser.rb", "lib/sass/scss/parser.rb", "lib/sass/scss/script_lexer.rb", "lib/sass/scss/rx.rb", "lib/sass/scss/script_parser.rb", "lib/sass/scss/css_parser.rb", "lib/sass/logger/log_level.rb", "lib/sass/logger/base.rb", "lib/sass/css.rb", "lib/sass/script.rb", "lib/sass/util.rb", "lib/sass/importers/filesystem.rb", "lib/sass/importers/base.rb", "lib/sass/script/color.rb", "lib/sass/script/variable.rb", "lib/sass/script/operation.rb", "lib/sass/script/funcall.rb", "lib/sass/script/literal.rb", "lib/sass/script/parser.rb", "lib/sass/script/functions.rb", "lib/sass/script/number.rb", "lib/sass/script/string_interpolation.rb", "lib/sass/script/interpolation.rb", "lib/sass/script/arg_list.rb", "lib/sass/script/node.rb", "lib/sass/script/bool.rb", "lib/sass/script/unary_operation.rb", "lib/sass/script/lexer.rb", "lib/sass/script/list.rb", "lib/sass/script/css_lexer.rb", "lib/sass/script/null.rb", "lib/sass/script/string.rb", "lib/sass/script/css_parser.rb", "lib/sass/selector.rb", "lib/sass/callbacks.rb", "lib/sass/selector/simple.rb", "lib/sass/selector/sequence.rb", "lib/sass/selector/abstract_sequence.rb", "lib/sass/selector/comma_sequence.rb", "lib/sass/selector/simple_sequence.rb", "lib/sass/railtie.rb", "lib/sass/environment.rb", "lib/sass/exec.rb", "vendor/listen/README.md", "vendor/listen/CONTRIBUTING.md", "vendor/listen/Guardfile", "vendor/listen/Gemfile", "vendor/listen/lib/listen/turnstile.rb", "vendor/listen/lib/listen/directory_record.rb", "vendor/listen/lib/listen/version.rb", "vendor/listen/lib/listen/dependency_manager.rb", "vendor/listen/lib/listen/multi_listener.rb", "vendor/listen/lib/listen/listener.rb", "vendor/listen/lib/listen/adapters/polling.rb", "vendor/listen/lib/listen/adapters/darwin.rb", "vendor/listen/lib/listen/adapters/linux.rb", "vendor/listen/lib/listen/adapters/bsd.rb", "vendor/listen/lib/listen/adapters/windows.rb", "vendor/listen/lib/listen/adapter.rb", "vendor/listen/lib/listen.rb", "vendor/listen/CHANGELOG.md", "vendor/listen/Rakefile", "vendor/listen/LICENSE", "vendor/listen/listen.gemspec", "vendor/listen/Vagrantfile", "vendor/listen/spec/listen/dependency_manager_spec.rb", "vendor/listen/spec/listen/directory_record_spec.rb", "vendor/listen/spec/listen/adapters/linux_spec.rb", "vendor/listen/spec/listen/adapters/darwin_spec.rb", "vendor/listen/spec/listen/adapters/bsd_spec.rb", "vendor/listen/spec/listen/adapters/polling_spec.rb", "vendor/listen/spec/listen/adapters/windows_spec.rb", "vendor/listen/spec/listen/turnstile_spec.rb", "vendor/listen/spec/listen/adapter_spec.rb", "vendor/listen/spec/listen/listener_spec.rb", "vendor/listen/spec/listen/multi_listener_spec.rb", "vendor/listen/spec/listen_spec.rb", "vendor/listen/spec/spec_helper.rb", "vendor/listen/spec/support/directory_record_helper.rb", "vendor/listen/spec/support/listeners_helper.rb", "vendor/listen/spec/support/adapter_helper.rb", "vendor/listen/spec/support/platform_helper.rb", "vendor/listen/spec/support/fixtures_helper.rb", "bin/sass-convert", "bin/scss", "bin/sass", "test/Gemfile", "test/Gemfile.lock", "test/test_helper.rb", "test/sass/engine_test.rb", "test/sass/functions_test.rb", "test/sass/fixtures/test_staleness_check_across_importers.scss", "test/sass/fixtures/test_staleness_check_across_importers.css", "test/sass/data/hsl-rgb.txt", "test/sass/extend_test.rb", "test/sass/logger_test.rb", "test/sass/css2sass_test.rb", "test/sass/templates/_filename_fn_import.scss", "test/sass/templates/basic.sass", "test/sass/templates/mixins.sass", "test/sass/templates/options.sass", "test/sass/templates/scss_import.scss", "test/sass/templates/subdir/subdir.sass", "test/sass/templates/subdir/nested_subdir/_nested_partial.sass", "test/sass/templates/subdir/nested_subdir/nested_subdir.sass", "test/sass/templates/_imported_content.sass", "test/sass/templates/filename_fn.scss", "test/sass/templates/alt.sass", "test/sass/templates/nested_bork1.sass", "test/sass/templates/same_name_different_partiality.scss", "test/sass/templates/complex.sass", "test/sass/templates/units.sass", "test/sass/templates/nested_import.sass", "test/sass/templates/importee.sass", "test/sass/templates/importee.less", "test/sass/templates/_cached_import_option_partial.scss", "test/sass/templates/scss_importee.scss", "test/sass/templates/line_numbers.sass", "test/sass/templates/expanded.sass", "test/sass/templates/bork3.sass", "test/sass/templates/import_content.sass", "test/sass/templates/warn_imported.sass", "test/sass/templates/import_charset_ibm866.sass", "test/sass/templates/bork1.sass", "test/sass/templates/warn.sass", "test/sass/templates/bork2.sass", "test/sass/templates/nested.sass", "test/sass/templates/compact.sass", "test/sass/templates/single_import_loop.sass", "test/sass/templates/_same_name_different_partiality.scss", "test/sass/templates/multiline.sass", "test/sass/templates/_imported_charset_ibm866.sass", "test/sass/templates/double_import_loop1.sass", "test/sass/templates/_double_import_loop2.sass", "test/sass/templates/import_charset.sass", "test/sass/templates/parent_ref.sass", "test/sass/templates/import.sass", "test/sass/templates/nested_bork3.sass", "test/sass/templates/script.sass", "test/sass/templates/same_name_different_ext.scss", "test/sass/templates/bork4.sass", "test/sass/templates/if.sass", "test/sass/templates/_partial.sass", "test/sass/templates/nested_mixin_bork.sass", "test/sass/templates/import_charset_1_8.sass", "test/sass/templates/same_name_different_ext.sass", "test/sass/templates/nested_bork2.sass", "test/sass/templates/mixin_bork.sass", "test/sass/templates/compressed.sass", "test/sass/templates/nested_bork4.sass", "test/sass/templates/cached_import_option.scss", "test/sass/templates/_imported_charset_utf8.sass", "test/sass/conversion_test.rb", "test/sass/script_test.rb", "test/sass/util/subset_map_test.rb", "test/sass/util/multibyte_string_scanner_test.rb", "test/sass/callbacks_test.rb", "test/sass/importer_test.rb", "test/sass/scss/css_test.rb", "test/sass/scss/scss_test.rb", "test/sass/scss/rx_test.rb", "test/sass/scss/test_helper.rb", "test/sass/util_test.rb", "test/sass/results/mixins.css", "test/sass/results/warn_imported.css", "test/sass/results/expanded.css", "test/sass/results/compact.css", "test/sass/results/import_content.css", "test/sass/results/compressed.css", "test/sass/results/scss_importee.css", "test/sass/results/basic.css", "test/sass/results/subdir/nested_subdir/nested_subdir.css", "test/sass/results/subdir/subdir.css", "test/sass/results/options.css", "test/sass/results/scss_import.css", "test/sass/results/units.css", "test/sass/results/parent_ref.css", "test/sass/results/script.css", "test/sass/results/complex.css", "test/sass/results/cached_import_option.css", "test/sass/results/import_charset.css", "test/sass/results/alt.css", "test/sass/results/if.css", "test/sass/results/multiline.css", "test/sass/results/import_charset_1_8.css", "test/sass/results/warn.css", "test/sass/results/import_charset_ibm866.css", "test/sass/results/filename_fn.css", "test/sass/results/import.css", "test/sass/results/nested.css", "test/sass/results/line_numbers.css", "test/sass/test_helper.rb", "test/sass/more_templates/_more_partial.sass", "test/sass/more_templates/more_import.sass", "test/sass/more_templates/more1.sass", "test/sass/script_conversion_test.rb", "test/sass/more_results/more1.css", "test/sass/more_results/more1_with_line_comments.css", "test/sass/more_results/more_import.css", "test/sass/mock_importer.rb", "test/sass/cache_test.rb", "test/sass/plugin_test.rb", "extra/update_watch.rb", "Rakefile", "init.rb", ".yardopts", "README.md", "VERSION_NAME", "VERSION_DATE", "REVISION", "MIT-LICENSE", "VERSION", "CONTRIBUTING"]
  s.homepage = %q{http://sass-lang.com/}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubyforge_project = %q{sass}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A powerful but elegant CSS compiler that makes CSS fun again.}
  s.test_files = ["test/sass/engine_test.rb", "test/sass/functions_test.rb", "test/sass/extend_test.rb", "test/sass/logger_test.rb", "test/sass/css2sass_test.rb", "test/sass/conversion_test.rb", "test/sass/script_test.rb", "test/sass/util/subset_map_test.rb", "test/sass/util/multibyte_string_scanner_test.rb", "test/sass/callbacks_test.rb", "test/sass/importer_test.rb", "test/sass/scss/css_test.rb", "test/sass/scss/scss_test.rb", "test/sass/scss/rx_test.rb", "test/sass/util_test.rb", "test/sass/script_conversion_test.rb", "test/sass/cache_test.rb", "test/sass/plugin_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<yard>, [">= 0.5.3"])
      s.add_development_dependency(%q<maruku>, [">= 0.5.9"])
    else
      s.add_dependency(%q<yard>, [">= 0.5.3"])
      s.add_dependency(%q<maruku>, [">= 0.5.9"])
    end
  else
    s.add_dependency(%q<yard>, [">= 0.5.3"])
    s.add_dependency(%q<maruku>, [">= 0.5.9"])
  end
end
