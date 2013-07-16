# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "bootstrap-tooltip-rails"
  s.version = "0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brandon Hilkert"]
  s.date = "2012-02-01"
  s.description = "A Ruby Gem that embeds the code necessary to easily use Twitter's Bootstrap Tooltip library within your application."
  s.email = ["brandonhilkert@gmail.com"]
  s.homepage = ""
  s.require_paths = ["lib"]
  s.rubyforge_project = "bootstrap-tooltip-rails"
  s.rubygems_version = "1.8.23"
  s.summary = "Adds Twitter's Bootstrap Tooltips to Rails"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_runtime_dependency(%q<thor>, [">= 0"])
      s.add_runtime_dependency(%q<rails>, [">= 3.1"])
    else
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<thor>, [">= 0"])
      s.add_dependency(%q<rails>, [">= 3.1"])
    end
  else
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<thor>, [">= 0"])
    s.add_dependency(%q<rails>, [">= 3.1"])
  end
end
