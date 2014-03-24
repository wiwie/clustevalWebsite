# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{twitter-bootstrap-rails}
  s.version = "2.2.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Seyhun Akyurek"]
  s.date = %q{2013-06-05}
  s.description = %q{twitter-bootstrap-rails project integrates Bootstrap CSS toolkit for Rails 3.1 Asset Pipeline}
  s.email = ["seyhunak@gmail.com"]
  s.files = ["lib/generators/bootstrap/install/install_generator.rb", "lib/generators/bootstrap/install/templates/application.css", "lib/generators/bootstrap/install/templates/application.js", "lib/generators/bootstrap/install/templates/bootstrap.coffee", "lib/generators/bootstrap/install/templates/bootstrap.js", "lib/generators/bootstrap/install/templates/bootstrap_and_overrides.css", "lib/generators/bootstrap/install/templates/bootstrap_and_overrides.less", "lib/generators/bootstrap/install/templates/en.bootstrap.yml", "lib/generators/bootstrap/layout/layout_generator.rb", "lib/generators/bootstrap/layout/templates/layout.html.erb", "lib/generators/bootstrap/layout/templates/layout.html.haml", "lib/generators/bootstrap/layout/templates/layout.html.slim", "lib/generators/bootstrap/partial/partial_generator.rb", "lib/generators/bootstrap/partial/templates/_login.html.erb", "lib/generators/bootstrap/themed/templates/_form.html.erb", "lib/generators/bootstrap/themed/templates/_form.html.haml", "lib/generators/bootstrap/themed/templates/_form.html.slim", "lib/generators/bootstrap/themed/templates/edit.html.erb", "lib/generators/bootstrap/themed/templates/edit.html.haml", "lib/generators/bootstrap/themed/templates/edit.html.slim", "lib/generators/bootstrap/themed/templates/index.html.erb", "lib/generators/bootstrap/themed/templates/index.html.haml", "lib/generators/bootstrap/themed/templates/index.html.slim", "lib/generators/bootstrap/themed/templates/new.html.erb", "lib/generators/bootstrap/themed/templates/new.html.haml", "lib/generators/bootstrap/themed/templates/new.html.slim", "lib/generators/bootstrap/themed/templates/show.html.erb", "lib/generators/bootstrap/themed/templates/show.html.haml", "lib/generators/bootstrap/themed/templates/show.html.slim", "lib/generators/bootstrap/themed/templates/simple_form/_form.html.erb", "lib/generators/bootstrap/themed/templates/simple_form/_form.html.haml", "lib/generators/bootstrap/themed/templates/simple_form/_form.html.slim", "lib/generators/bootstrap/themed/themed_generator.rb", "lib/twitter/bootstrap/rails/bootstrap.rb", "lib/twitter/bootstrap/rails/engine.rb", "lib/twitter/bootstrap/rails/twitter-bootstrap-breadcrumbs.rb", "lib/twitter/bootstrap/rails/version.rb", "lib/twitter-bootstrap-rails.rb", "vendor/static-source/bootstrap.less", "vendor/static-source/fontawesome.less", "vendor/static-source/sprites.less", "vendor/toolkit/fontawesome/bootstrap.less", "vendor/toolkit/fontawesome/core.less", "vendor/toolkit/fontawesome/extras.less", "vendor/toolkit/fontawesome/font-awesome-ie7.less", "vendor/toolkit/fontawesome/font-awesome.less", "vendor/toolkit/fontawesome/icons.less", "vendor/toolkit/fontawesome/mixins.less", "vendor/toolkit/fontawesome/path.less", "vendor/toolkit/fontawesome/variables.less", "vendor/toolkit/twitter/bootstrap/accordion.less", "vendor/toolkit/twitter/bootstrap/alerts.less", "vendor/toolkit/twitter/bootstrap/bootstrap.less", "vendor/toolkit/twitter/bootstrap/breadcrumbs.less", "vendor/toolkit/twitter/bootstrap/button-groups.less", "vendor/toolkit/twitter/bootstrap/buttons.less", "vendor/toolkit/twitter/bootstrap/carousel.less", "vendor/toolkit/twitter/bootstrap/close.less", "vendor/toolkit/twitter/bootstrap/code.less", "vendor/toolkit/twitter/bootstrap/component-animations.less", "vendor/toolkit/twitter/bootstrap/dropdowns.less", "vendor/toolkit/twitter/bootstrap/forms.less", "vendor/toolkit/twitter/bootstrap/grid.less", "vendor/toolkit/twitter/bootstrap/hero-unit.less", "vendor/toolkit/twitter/bootstrap/labels-badges.less", "vendor/toolkit/twitter/bootstrap/layouts.less", "vendor/toolkit/twitter/bootstrap/media.less", "vendor/toolkit/twitter/bootstrap/mixins.less", "vendor/toolkit/twitter/bootstrap/modals.less", "vendor/toolkit/twitter/bootstrap/navbar.less", "vendor/toolkit/twitter/bootstrap/navs.less", "vendor/toolkit/twitter/bootstrap/pager.less", "vendor/toolkit/twitter/bootstrap/pagination.less", "vendor/toolkit/twitter/bootstrap/popovers.less", "vendor/toolkit/twitter/bootstrap/progress-bars.less", "vendor/toolkit/twitter/bootstrap/reset.less", "vendor/toolkit/twitter/bootstrap/responsive-1200px-min.less", "vendor/toolkit/twitter/bootstrap/responsive-767px-max.less", "vendor/toolkit/twitter/bootstrap/responsive-768px-979px.less", "vendor/toolkit/twitter/bootstrap/responsive-navbar.less", "vendor/toolkit/twitter/bootstrap/responsive-utilities.less", "vendor/toolkit/twitter/bootstrap/responsive.less", "vendor/toolkit/twitter/bootstrap/scaffolding.less", "vendor/toolkit/twitter/bootstrap/sprites.less", "vendor/toolkit/twitter/bootstrap/tables.less", "vendor/toolkit/twitter/bootstrap/thumbnails.less", "vendor/toolkit/twitter/bootstrap/tooltip.less", "vendor/toolkit/twitter/bootstrap/type.less", "vendor/toolkit/twitter/bootstrap/utilities.less", "vendor/toolkit/twitter/bootstrap/variables.less", "vendor/toolkit/twitter/bootstrap/wells.less", "vendor/toolkit/twitter/bootstrap_base.less", "app/assets/fonts/fontawesome-webfont.eot", "app/assets/fonts/fontawesome-webfont.svg", "app/assets/fonts/fontawesome-webfont.ttf", "app/assets/fonts/fontawesome-webfont.woff", "app/assets/images/twitter/bootstrap/glyphicons-halflings-white.png", "app/assets/images/twitter/bootstrap/glyphicons-halflings.png", "app/assets/javascripts/twitter/bootstrap/bootstrap-affix.js", "app/assets/javascripts/twitter/bootstrap/bootstrap-alert.js", "app/assets/javascripts/twitter/bootstrap/bootstrap-button.js", "app/assets/javascripts/twitter/bootstrap/bootstrap-carousel.js", "app/assets/javascripts/twitter/bootstrap/bootstrap-collapse.js", "app/assets/javascripts/twitter/bootstrap/bootstrap-dropdown.js", "app/assets/javascripts/twitter/bootstrap/bootstrap-modal.js", "app/assets/javascripts/twitter/bootstrap/bootstrap-popover.js", "app/assets/javascripts/twitter/bootstrap/bootstrap-scrollspy.js", "app/assets/javascripts/twitter/bootstrap/bootstrap-tab.js", "app/assets/javascripts/twitter/bootstrap/bootstrap-tooltip.js", "app/assets/javascripts/twitter/bootstrap/bootstrap-transition.js", "app/assets/javascripts/twitter/bootstrap/bootstrap-typeahead.js", "app/assets/javascripts/twitter/bootstrap.js", "app/assets/javascripts/twitter/bootstrap_ujs.js", "app/assets/stylesheets/twitter-bootstrap-static/bootstrap.css.erb", "app/assets/stylesheets/twitter-bootstrap-static/fontawesome.css.erb", "app/assets/stylesheets/twitter-bootstrap-static/sprites.css.erb", "app/helpers/badge_label_helper.rb", "app/helpers/bootstrap_flash_helper.rb", "app/helpers/flash_block_helper.rb", "app/helpers/glyph_helper.rb", "app/helpers/modal_helper.rb", "app/helpers/navbar_helper.rb", "app/helpers/twitter_breadcrumbs_helper.rb", "app/views/twitter-bootstrap/_breadcrumbs.html.erb", "Rakefile", "README.md", "spec/lib/twitter_bootstrap_rails/badge_label_helper_spec.rb", "spec/lib/twitter_bootstrap_rails/modal_helper_spec.rb", "spec/lib/twitter_bootstrap_rails/navbar_helper_spec.rb", "spec/lib/twitter_bootstrap_rails/uri_state_spec.rb", "spec/spec_helper.rb", "test/lib/breadcrumbs_test.rb", "test/test_helper.rb"]
  s.homepage = %q{https://github.com/seyhunak/twitter-bootstrap-rails}
  s.post_install_message = %q{Important: You may need to add a javascript runtime to your Gemfile in order for bootstrap's LESS files to compile to CSS. 

**********************************************

ExecJS supports these runtimes:

therubyracer - Google V8 embedded within Ruby

therubyrhino - Mozilla Rhino embedded within JRuby

Node.js

Apple JavaScriptCore - Included with Mac OS X

Microsoft Windows Script Host (JScript)

**********************************************}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{twitter-bootstrap-rails}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Bootstrap CSS toolkit for Rails 3.1 Asset Pipeline}
  s.test_files = ["spec/lib/twitter_bootstrap_rails/badge_label_helper_spec.rb", "spec/lib/twitter_bootstrap_rails/modal_helper_spec.rb", "spec/lib/twitter_bootstrap_rails/navbar_helper_spec.rb", "spec/lib/twitter_bootstrap_rails/uri_state_spec.rb", "spec/spec_helper.rb", "test/lib/breadcrumbs_test.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 3.1"])
      s.add_runtime_dependency(%q<actionpack>, [">= 3.1"])
      s.add_runtime_dependency(%q<execjs>, [">= 0"])
      s.add_runtime_dependency(%q<rails>, [">= 3.1"])
      s.add_development_dependency(%q<less>, [">= 0"])
      s.add_development_dependency(%q<therubyracer>, ["= 0.11.1"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<railties>, [">= 3.1"])
      s.add_dependency(%q<actionpack>, [">= 3.1"])
      s.add_dependency(%q<execjs>, [">= 0"])
      s.add_dependency(%q<rails>, [">= 3.1"])
      s.add_dependency(%q<less>, [">= 0"])
      s.add_dependency(%q<therubyracer>, ["= 0.11.1"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<railties>, [">= 3.1"])
    s.add_dependency(%q<actionpack>, [">= 3.1"])
    s.add_dependency(%q<execjs>, [">= 0"])
    s.add_dependency(%q<rails>, [">= 3.1"])
    s.add_dependency(%q<less>, [">= 0"])
    s.add_dependency(%q<therubyracer>, ["= 0.11.1"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
