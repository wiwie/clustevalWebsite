# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "raphael-rails"
  s.version = "2.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dmitry Baranovskiy", "Ben Poweski", "Robert Fletcher"]
  s.date = "2013-01-15"
  s.description = "Raphael JS as a Rubygem for use in the Rails asset pipeline"
  s.email = ["bpoweski@3factors.com"]
  s.homepage = "https://github.com/mockdeep/raphael-rails"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Raphael JS as a Rubygem"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
