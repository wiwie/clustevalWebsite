# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{libv8}
  s.version = "3.11.8.13"
  s.platform = %q{x86_64-linux}

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Charles Lowell"]
  s.date = %q{2013-01-09}
  s.description = %q{Distributes the V8 JavaScript engine in binary and source forms in order to support fast builds of The Ruby Racer}
  s.email = ["cowboyd@thefrontside.net"]
  s.files = ["lib/libv8.rb", "lib/libv8/version.rb", "ext/libv8/arch.rb", "ext/libv8/location.rb", "ext/libv8/paths.rb", "ext/libv8/.location.yml", "vendor/v8/include/v8-preparser.h", "vendor/v8/include/v8stdint.h", "vendor/v8/include/v8-profiler.h", "vendor/v8/include/v8.h", "vendor/v8/include/v8-debug.h", "vendor/v8/include/v8-testing.h", "vendor/v8/out/x64.release/obj.target/tools/gyp/libv8_base.a", "vendor/v8/out/x64.release/obj.target/tools/gyp/libv8_nosnapshot.a", "vendor/v8/out/x64.release/obj.target/tools/gyp/libpreparser_lib.a", "vendor/v8/out/x64.release/obj.target/tools/gyp/libv8_snapshot.a"]
  s.homepage = %q{http://github.com/cowboyd/libv8}
  s.require_paths = ["lib", "ext"]
  s.rubyforge_project = %q{libv8}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Distribution of the V8 JavaScript engine}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rake-compiler>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rspec-spies>, [">= 0"])
      s.add_development_dependency(%q<vulcan>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rake-compiler>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rspec-spies>, [">= 0"])
      s.add_dependency(%q<vulcan>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rake-compiler>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rspec-spies>, [">= 0"])
    s.add_dependency(%q<vulcan>, [">= 0"])
  end
end
