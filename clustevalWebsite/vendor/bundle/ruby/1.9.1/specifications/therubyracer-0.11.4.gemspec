# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{therubyracer}
  s.version = "0.11.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Charles Lowell"]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDPjCCAiagAwIBAgIBADANBgkqhkiG9w0BAQUFADBFMRAwDgYDVQQDDAdjb3di\nb3lkMRwwGgYKCZImiZPyLGQBGRYMdGhlZnJvbnRzaWRlMRMwEQYKCZImiZPyLGQB\nGRYDbmV0MB4XDTEzMDEzMDIxMDYwNFoXDTE0MDEzMDIxMDYwNFowRTEQMA4GA1UE\nAwwHY293Ym95ZDEcMBoGCgmSJomT8ixkARkWDHRoZWZyb250c2lkZTETMBEGCgmS\nJomT8ixkARkWA25ldDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAO45\nCUxpETDGYXjCCy2dMg/aIrdrTqBqQW5ZrzhHxF9EkcdmWFr0z/qMz0JSpZ3pF11Z\nKYaj5PaQQpjZfLPwbuiGGkuSWi+UAac//V18xo6S4lzRBjO+gpzG9f2AOzt9b+SR\nUc8UhO7QBZ5edUDxMxw9QstD+U0YBAlzsPJbHuUOqdtxXmNQCds3ZnqTgZaIpdUy\nCSejtrukSmlthxFzwgMezYQhcYxmkl+Q475JUodnI6Pjc6nja/Or8Y6cEWiLgeUa\na+efcPGLDEbwJC7TGRrvk8yassMByBEJ3XueTMzeqWFd+665ptciojYo6BvIAR0N\niLwks0x567FZyS8SqTcCAwEAAaM5MDcwCQYDVR0TBAIwADAdBgNVHQ4EFgQUxVgR\n5TUqf7Hd24ICb3g4FNbM7oYwCwYDVR0PBAQDAgSwMA0GCSqGSIb3DQEBBQUAA4IB\nAQDdJj+NzZhiYXA56z0wzRUA/Fcf6CYqKB+RFRlPssDEcHTor5SnwdWgQof/gNLi\nQel1Om4zO0Shcp89jxaUqtvEdYVhmyfc0vycHmemKttNBT734yMrEJtF8Hhy+Dnz\n9CzixXLvgGaRH+mf3M0+l+zIDJJr2L+39L8cyTSSRnp/srfI8aSmJKhGshudBKoC\nTy6Gi071pwoJXvdMaE/6iPy7bUzlndYdHyYuWSKaO9N47HqQ62oEnBraglw6ghoi\nUgImJlChAzCoDP9zi9tdm6jAr7ttF25R9PPYr11ILb7dYe3qUzlNlM6zJx/nb31b\nIhdyRVup4qLcqYSTPsm6u7VA\n-----END CERTIFICATE-----\n"]
  s.date = %q{2013-02-26}
  s.description = %q{Call JavaScript code and manipulate JavaScript objects from Ruby. Call Ruby code and manipulate Ruby objects from JavaScript.}
  s.email = ["javascript-and-friends@googlegroups.com"]
  s.extensions = ["ext/v8/extconf.rb"]
  s.files = [".gitignore", ".travis.yml", "Changelog.md", "Gemfile", "README.md", "Rakefile", "benchmarks.rb", "ext/v8/accessor.cc", "ext/v8/array.cc", "ext/v8/backref.cc", "ext/v8/constants.cc", "ext/v8/constraints.cc", "ext/v8/context.cc", "ext/v8/date.cc", "ext/v8/exception.cc", "ext/v8/extconf.rb", "ext/v8/external.cc", "ext/v8/function.cc", "ext/v8/gc.cc", "ext/v8/handles.cc", "ext/v8/heap.cc", "ext/v8/init.cc", "ext/v8/invocation.cc", "ext/v8/locker.cc", "ext/v8/message.cc", "ext/v8/object.cc", "ext/v8/primitive.cc", "ext/v8/rr.cc", "ext/v8/rr.h", "ext/v8/script.cc", "ext/v8/signature.cc", "ext/v8/stack.cc", "ext/v8/string.cc", "ext/v8/template.cc", "ext/v8/trycatch.cc", "ext/v8/v8.cc", "ext/v8/value.cc", "lib/v8.rb", "lib/v8/access.rb", "lib/v8/access/indices.rb", "lib/v8/access/invocation.rb", "lib/v8/access/names.rb", "lib/v8/array.rb", "lib/v8/context.rb", "lib/v8/conversion.rb", "lib/v8/conversion/array.rb", "lib/v8/conversion/class.rb", "lib/v8/conversion/code.rb", "lib/v8/conversion/fixnum.rb", "lib/v8/conversion/fundamental.rb", "lib/v8/conversion/hash.rb", "lib/v8/conversion/indentity.rb", "lib/v8/conversion/method.rb", "lib/v8/conversion/object.rb", "lib/v8/conversion/primitive.rb", "lib/v8/conversion/proc.rb", "lib/v8/conversion/reference.rb", "lib/v8/conversion/string.rb", "lib/v8/conversion/symbol.rb", "lib/v8/conversion/time.rb", "lib/v8/error.rb", "lib/v8/function.rb", "lib/v8/object.rb", "lib/v8/stack.rb", "lib/v8/version.rb", "lib/v8/weak.rb", "spec/c/array_spec.rb", "spec/c/constants_spec.rb", "spec/c/exception_spec.rb", "spec/c/external_spec.rb", "spec/c/function_spec.rb", "spec/c/handles_spec.rb", "spec/c/locker_spec.rb", "spec/c/object_spec.rb", "spec/c/script_spec.rb", "spec/c/string_spec.rb", "spec/c/template_spec.rb", "spec/c/trycatch_spec.rb", "spec/mem/blunt_spec.rb", "spec/redjs_spec.rb", "spec/spec_helper.rb", "spec/threading_spec.rb", "spec/v8/context_spec.rb", "spec/v8/conversion_spec.rb", "spec/v8/error_spec.rb", "spec/v8/function_spec.rb", "spec/v8/object_spec.rb", "thefrontside.png", "therubyracer.gemspec"]
  s.homepage = %q{http://github.com/cowboyd/therubyracer}
  s.require_paths = ["lib", "ext"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Embed the V8 JavaScript interpreter into Ruby}
  s.test_files = ["spec/c/array_spec.rb", "spec/c/constants_spec.rb", "spec/c/exception_spec.rb", "spec/c/external_spec.rb", "spec/c/function_spec.rb", "spec/c/handles_spec.rb", "spec/c/locker_spec.rb", "spec/c/object_spec.rb", "spec/c/script_spec.rb", "spec/c/string_spec.rb", "spec/c/template_spec.rb", "spec/c/trycatch_spec.rb", "spec/mem/blunt_spec.rb", "spec/redjs_spec.rb", "spec/spec_helper.rb", "spec/threading_spec.rb", "spec/v8/context_spec.rb", "spec/v8/conversion_spec.rb", "spec/v8/error_spec.rb", "spec/v8/function_spec.rb", "spec/v8/object_spec.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ref>, [">= 0"])
      s.add_runtime_dependency(%q<libv8>, ["~> 3.11.8.12"])
    else
      s.add_dependency(%q<ref>, [">= 0"])
      s.add_dependency(%q<libv8>, ["~> 3.11.8.12"])
    end
  else
    s.add_dependency(%q<ref>, [">= 0"])
    s.add_dependency(%q<libv8>, ["~> 3.11.8.12"])
  end
end
