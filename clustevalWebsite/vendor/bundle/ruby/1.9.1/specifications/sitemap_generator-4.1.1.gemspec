# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sitemap_generator}
  s.version = "4.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Karl Varga"]
  s.date = %q{2013-07-13}
  s.description = %q{SitemapGenerator is a framework-agnostic XML Sitemap generator written in Ruby with automatic Rails integration.  It supports Video, News, Image, Geo, Mobile, PageMap and Alternate Links sitemap extensions and includes Rake tasks for managing your sitemaps, as well as many other great features.}
  s.email = %q{kjvarga@gmail.com}
  s.files = ["Gemfile", "Gemfile.lock", "MIT-LICENSE", "Rakefile", "README.md", "VERSION", "lib/sitemap_generator/adapters/file_adapter.rb", "lib/sitemap_generator/adapters/s3_adapter.rb", "lib/sitemap_generator/adapters/wave_adapter.rb", "lib/sitemap_generator/adapters.rb", "lib/sitemap_generator/application.rb", "lib/sitemap_generator/builder/sitemap_file.rb", "lib/sitemap_generator/builder/sitemap_index_file.rb", "lib/sitemap_generator/builder/sitemap_index_url.rb", "lib/sitemap_generator/builder/sitemap_url.rb", "lib/sitemap_generator/builder.rb", "lib/sitemap_generator/core_ext/big_decimal.rb", "lib/sitemap_generator/core_ext/numeric.rb", "lib/sitemap_generator/core_ext.rb", "lib/sitemap_generator/helpers/number_helper.rb", "lib/sitemap_generator/interpreter.rb", "lib/sitemap_generator/link_set.rb", "lib/sitemap_generator/railtie.rb", "lib/sitemap_generator/sitemap_location.rb", "lib/sitemap_generator/sitemap_namer.rb", "lib/sitemap_generator/tasks.rb", "lib/sitemap_generator/templates.rb", "lib/sitemap_generator/utilities.rb", "lib/sitemap_generator.rb", "lib/tasks/sitemap_generator_tasks.rake", "rails/install.rb", "rails/uninstall.rb", "templates/sitemap.rb", "spec/blueprint.rb", "spec/files/sitemap.create.rb", "spec/files/sitemap.deprecated.rb", "spec/files/sitemap.groups.rb", "spec/sitemap_generator/alternate_sitemap_spec.rb", "spec/sitemap_generator/application_spec.rb", "spec/sitemap_generator/builder/sitemap_file_spec.rb", "spec/sitemap_generator/builder/sitemap_index_file_spec.rb", "spec/sitemap_generator/builder/sitemap_index_url_spec.rb", "spec/sitemap_generator/builder/sitemap_url_spec.rb", "spec/sitemap_generator/core_ext/bigdecimal_spec.rb", "spec/sitemap_generator/core_ext/numeric_spec.rb", "spec/sitemap_generator/geo_sitemap_spec.rb", "spec/sitemap_generator/helpers/number_helper_spec.rb", "spec/sitemap_generator/interpreter_spec.rb", "spec/sitemap_generator/link_set_spec.rb", "spec/sitemap_generator/mobile_sitemap_spec.rb", "spec/sitemap_generator/news_sitemap_spec.rb", "spec/sitemap_generator/pagemap_sitemap_spec.rb", "spec/sitemap_generator/sitemap_generator_spec.rb", "spec/sitemap_generator/sitemap_groups_spec.rb", "spec/sitemap_generator/sitemap_location_spec.rb", "spec/sitemap_generator/sitemap_namer_spec.rb", "spec/sitemap_generator/templates_spec.rb", "spec/sitemap_generator/utilities/existence_spec.rb", "spec/sitemap_generator/utilities/hash_spec.rb", "spec/sitemap_generator/utilities/rounding_spec.rb", "spec/sitemap_generator/utilities_spec.rb", "spec/sitemap_generator/video_sitemap_spec.rb", "spec/spec_helper.rb", "spec/support/file_macros.rb", "spec/support/schemas/siteindex.xsd", "spec/support/schemas/sitemap-geo.xsd", "spec/support/schemas/sitemap-mobile.xsd", "spec/support/schemas/sitemap-news.xsd", "spec/support/schemas/sitemap-pagemap.xsd", "spec/support/schemas/sitemap-video.xsd", "spec/support/schemas/sitemap.xsd", "spec/support/xml_macros.rb"]
  s.homepage = %q{http://github.com/kjvarga/sitemap_generator}
  s.post_install_message = %q{NOTE: SitemapGenerator 4.x uses a new file naming scheme which is more standards-compliant.
If you're upgrading from 3.x, please see the release note in the README:

https://github.com/kjvarga/sitemap_generator#important-changes-in-version-4

The simple answer is that your index file is now called sitemap.xml.gz
and not sitemap_index.xml.gz, but please take a look and see what else has changed.
}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Easily generate XML Sitemaps}
  s.test_files = ["spec/blueprint.rb", "spec/files/sitemap.create.rb", "spec/files/sitemap.deprecated.rb", "spec/files/sitemap.groups.rb", "spec/sitemap_generator/alternate_sitemap_spec.rb", "spec/sitemap_generator/application_spec.rb", "spec/sitemap_generator/builder/sitemap_file_spec.rb", "spec/sitemap_generator/builder/sitemap_index_file_spec.rb", "spec/sitemap_generator/builder/sitemap_index_url_spec.rb", "spec/sitemap_generator/builder/sitemap_url_spec.rb", "spec/sitemap_generator/core_ext/bigdecimal_spec.rb", "spec/sitemap_generator/core_ext/numeric_spec.rb", "spec/sitemap_generator/geo_sitemap_spec.rb", "spec/sitemap_generator/helpers/number_helper_spec.rb", "spec/sitemap_generator/interpreter_spec.rb", "spec/sitemap_generator/link_set_spec.rb", "spec/sitemap_generator/mobile_sitemap_spec.rb", "spec/sitemap_generator/news_sitemap_spec.rb", "spec/sitemap_generator/pagemap_sitemap_spec.rb", "spec/sitemap_generator/sitemap_generator_spec.rb", "spec/sitemap_generator/sitemap_groups_spec.rb", "spec/sitemap_generator/sitemap_location_spec.rb", "spec/sitemap_generator/sitemap_namer_spec.rb", "spec/sitemap_generator/templates_spec.rb", "spec/sitemap_generator/utilities/existence_spec.rb", "spec/sitemap_generator/utilities/hash_spec.rb", "spec/sitemap_generator/utilities/rounding_spec.rb", "spec/sitemap_generator/utilities_spec.rb", "spec/sitemap_generator/video_sitemap_spec.rb", "spec/spec_helper.rb", "spec/support/file_macros.rb", "spec/support/schemas/siteindex.xsd", "spec/support/schemas/sitemap-geo.xsd", "spec/support/schemas/sitemap-mobile.xsd", "spec/support/schemas/sitemap-news.xsd", "spec/support/schemas/sitemap-pagemap.xsd", "spec/support/schemas/sitemap-video.xsd", "spec/support/schemas/sitemap.xsd", "spec/support/xml_macros.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<nokogiri>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_runtime_dependency(%q<builder>, [">= 0"])
    else
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<builder>, [">= 0"])
    end
  else
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<builder>, [">= 0"])
  end
end
