# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{raphael-rails}
  s.version = "2.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dmitry Baranovskiy", "Ben Poweski", "Robert Fletcher"]
  s.date = %q{2013-01-15}
  s.description = %q{Raphael JS as a Rubygem for use in the Rails asset pipeline}
  s.email = ["bpoweski@3factors.com"]
  s.files = ["README.md", "license.txt", "Rakefile", "Gemfile", "lib/raphael-rails/version.rb", "lib/raphael-rails.rb", "vendor/assets/javascripts/raphael.core.js", "vendor/assets/javascripts/license.txt", "vendor/assets/javascripts/history.md", "vendor/assets/javascripts/raphael.js", "vendor/assets/javascripts/reference.html", "vendor/assets/javascripts/raphael-min.js", "vendor/assets/javascripts/make", "vendor/assets/javascripts/raphael.vml.js", "vendor/assets/javascripts/reference.js", "vendor/assets/javascripts/raphael.svg.js", "vendor/assets/javascripts/README.markdown"]
  s.homepage = %q{https://github.com/mockdeep/raphael-rails}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Raphael JS as a Rubygem}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
