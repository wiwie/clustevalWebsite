# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "mathjax-rails"
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Minqi Pan"]
  s.date = "2011-07-28"
  s.description = "This gem maintains MathJax at a system-wide directory."
  s.email = ["pmq2001@gmail.com"]
  s.homepage = "https://github.com/pmq20/mathjax-rails"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "a simple gem to integrate MathJax with Rails 3"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, ["~> 3.0"])
    else
      s.add_dependency(%q<railties>, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<railties>, ["~> 3.0"])
  end
end
