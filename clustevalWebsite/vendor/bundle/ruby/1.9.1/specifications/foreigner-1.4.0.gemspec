# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{foreigner}
  s.version = "1.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.5") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matthew Higgins"]
  s.date = %q{2013-02-26}
  s.description = %q{Adds helpers to migrations and dumps foreign keys to schema.rb}
  s.email = %q{developer@matthewhiggins.com}
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["MIT-LICENSE", "Rakefile", "README.rdoc", "lib/foreigner/adapter.rb", "lib/foreigner/connection_adapters/abstract/foreign_key_definition.rb", "lib/foreigner/connection_adapters/abstract/schema_definitions.rb", "lib/foreigner/connection_adapters/abstract/schema_statements.rb", "lib/foreigner/connection_adapters/abstract/table.rb", "lib/foreigner/connection_adapters/abstract/table_definition.rb", "lib/foreigner/connection_adapters/mysql2_adapter.rb", "lib/foreigner/connection_adapters/mysql_adapter.rb", "lib/foreigner/connection_adapters/noop_adapter.rb", "lib/foreigner/connection_adapters/postgresql_adapter.rb", "lib/foreigner/connection_adapters/sql2003.rb", "lib/foreigner/loader.rb", "lib/foreigner/migration/command_recorder.rb", "lib/foreigner/railtie.rb", "lib/foreigner/schema_dumper.rb", "lib/foreigner.rb", "test/foreigner/adapter_test.rb", "test/foreigner/connection_adapters/abstract/schema_statements_test.rb", "test/foreigner/connection_adapters/abstract/table_definition_test.rb", "test/foreigner/connection_adapters/mysql2_adapter_test.rb", "test/foreigner/connection_adapters/mysql_adapter_test.rb", "test/foreigner/connection_adapters/postgresql_adapter_test.rb", "test/foreigner/connection_adapters/sql2003_test.rb", "test/foreigner/migration/command_recorder_test.rb", "test/foreigner/schema_dumper_test.rb", "test/helper.rb"]
  s.homepage = %q{http://github.com/matthuhiggins/foreigner}
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubyforge_project = %q{foreigner}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Foreign Keys for Rails}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 3.0.0"])
      s.add_development_dependency(%q<activerecord>, [">= 3.1.0"])
    else
      s.add_dependency(%q<activerecord>, [">= 3.0.0"])
      s.add_dependency(%q<activerecord>, [">= 3.1.0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 3.0.0"])
    s.add_dependency(%q<activerecord>, [">= 3.1.0"])
  end
end
