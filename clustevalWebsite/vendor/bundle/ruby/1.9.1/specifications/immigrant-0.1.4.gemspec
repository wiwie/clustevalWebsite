# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{immigrant}
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.5") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jon Jensen"]
  s.date = %q{2012-12-13}
  s.description = %q{Adds a generator for creating a foreign key migration based on your current model associations}
  s.email = %q{jenseng@gmail.com}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["LICENSE.txt", "Rakefile", "README.rdoc", "lib/generators/USAGE", "lib/generators/immigration_generator.rb", "lib/generators/templates/immigration-pre-3.1.rb", "lib/generators/templates/immigration.rb", "lib/immigrant/foreign_key_definition.rb", "lib/immigrant/loader.rb", "lib/immigrant/railtie.rb", "lib/immigrant.rb", "test/helper.rb", "test/immigrant_test.rb"]
  s.homepage = %q{http://github.com/jenseng/immigrant}
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Migration generator for Foreigner}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 3.0"])
      s.add_runtime_dependency(%q<foreigner>, [">= 1.2.1"])
    else
      s.add_dependency(%q<activerecord>, [">= 3.0"])
      s.add_dependency(%q<foreigner>, [">= 1.2.1"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 3.0"])
    s.add_dependency(%q<foreigner>, [">= 1.2.1"])
  end
end
