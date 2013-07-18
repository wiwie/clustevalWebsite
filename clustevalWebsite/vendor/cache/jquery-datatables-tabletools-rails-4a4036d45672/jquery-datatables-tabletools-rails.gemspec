# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "jquery-datatables-tabletools-rails"
  s.version = "2.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matthew Callaway"]
  s.date = "2013-07-18"
  s.description = ""
  s.email = ["mcallawa@genome.wustl.edu"]
  s.files = ["Gemfile", "Rakefile", "Readme.md", "jquery-datatables-tabletools-rails.gemspec", "lib/jquery-datatables-tabletools-rails.rb", "lib/jquery/datatables/tabletools/rails/engine.rb", "lib/jquery/datatables/tabletools/rails/version.rb", "vendor/assets/images/dataTables/background.png", "vendor/assets/images/dataTables/collection.png", "vendor/assets/images/dataTables/collection.psd", "vendor/assets/images/dataTables/collection_hover.png", "vendor/assets/images/dataTables/copy document.psd", "vendor/assets/images/dataTables/copy.png", "vendor/assets/images/dataTables/copy_hover.png", "vendor/assets/images/dataTables/csv.png", "vendor/assets/images/dataTables/csv_hover.png", "vendor/assets/images/dataTables/file_types.psd", "vendor/assets/images/dataTables/pdf.png", "vendor/assets/images/dataTables/pdf_hover.png", "vendor/assets/images/dataTables/print.png", "vendor/assets/images/dataTables/print_hover.png", "vendor/assets/images/dataTables/printer.psd", "vendor/assets/images/dataTables/psd/collection.psd", "vendor/assets/images/dataTables/psd/copy document.psd", "vendor/assets/images/dataTables/psd/file_types.psd", "vendor/assets/images/dataTables/psd/printer.psd", "vendor/assets/images/dataTables/xls.png", "vendor/assets/images/dataTables/xls_hover.png", "vendor/assets/javascripts/dataTables/TableTools.js", "vendor/assets/javascripts/dataTables/TableTools.min.js", "vendor/assets/javascripts/dataTables/TableTools.min.js.gz", "vendor/assets/javascripts/dataTables/ZeroClipboard.js", "vendor/assets/stylesheets/dataTables/TableTools.css", "vendor/assets/stylesheets/dataTables/TableTools_JUI.css", "vendor/assets/swf/dataTables/copy_csv_xls.swf", "vendor/assets/swf/dataTables/copy_csv_xls_pdf.swf"]
  s.homepage = "https://github.com/kindjal/jquery-datatables-tabletools-rails"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "jquery datatables tabletools for rails"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jquery-datatables-rails>, [">= 0"])
    else
      s.add_dependency(%q<jquery-datatables-rails>, [">= 0"])
    end
  else
    s.add_dependency(%q<jquery-datatables-rails>, [">= 0"])
  end
end
