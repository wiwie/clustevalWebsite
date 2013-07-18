# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "jquery-datatables-rails"
  s.version = "1.11.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Robin Wenglewski"]
  s.date = "2013-07-18"
  s.description = ""
  s.email = ["robin@wenglewski.de"]
  s.files = ["lib/jquery-datatables-rails.rb", "lib/jquery", "lib/jquery/datatables", "lib/jquery/datatables/rails", "lib/jquery/datatables/rails/engine.rb", "lib/jquery/datatables/rails/version.rb", "vendor/assets", "vendor/assets/media", "vendor/assets/media/dataTables", "vendor/assets/media/dataTables/extras", "vendor/assets/media/dataTables/extras/swf", "vendor/assets/media/dataTables/extras/swf/copy_csv_xls_pdf.swf", "vendor/assets/media/dataTables/extras/swf/copy_csv_xls.swf", "vendor/assets/media/dataTables/extras/as3", "vendor/assets/media/dataTables/extras/as3/ZeroClipboardPdf.as", "vendor/assets/media/dataTables/extras/as3/lib", "vendor/assets/media/dataTables/extras/as3/lib/AlivePDF.swc", "vendor/assets/media/dataTables/extras/as3/ZeroClipboard.as", "vendor/assets/images", "vendor/assets/images/dataTables", "vendor/assets/images/dataTables/back_enabled.png", "vendor/assets/images/dataTables/sort_desc.png", "vendor/assets/images/dataTables/sort_both.png", "vendor/assets/images/dataTables/sort_desc_disabled.png", "vendor/assets/images/dataTables/sort_asc_disabled.png", "vendor/assets/images/dataTables/favicon.ico", "vendor/assets/images/dataTables/forward_enabled.png", "vendor/assets/images/dataTables/forward_disabled.png", "vendor/assets/images/dataTables/forward_enabled_hover.png", "vendor/assets/images/dataTables/back_disabled.png", "vendor/assets/images/dataTables/back_enabled_hover.png", "vendor/assets/images/dataTables/extras", "vendor/assets/images/dataTables/extras/pdf.png", "vendor/assets/images/dataTables/extras/print_hover.png", "vendor/assets/images/dataTables/extras/background.png", "vendor/assets/images/dataTables/extras/xls.png", "vendor/assets/images/dataTables/extras/csv.png", "vendor/assets/images/dataTables/extras/collection.png", "vendor/assets/images/dataTables/extras/xls_hover.png", "vendor/assets/images/dataTables/extras/copy.png", "vendor/assets/images/dataTables/extras/collection_hover.png", "vendor/assets/images/dataTables/extras/copy_hover.png", "vendor/assets/images/dataTables/extras/csv_hover.png", "vendor/assets/images/dataTables/extras/print.png", "vendor/assets/images/dataTables/extras/pdf_hover.png", "vendor/assets/images/dataTables/sort_asc.png", "vendor/assets/javascripts", "vendor/assets/javascripts/dataTables", "vendor/assets/javascripts/dataTables/jquery.dataTables.api.fnGetColumnData.js", "vendor/assets/javascripts/dataTables/jquery.dataTables.sorting.numbersHtml.js", "vendor/assets/javascripts/dataTables/jquery.dataTables.bootstrap.js", "vendor/assets/javascripts/dataTables/jquery.dataTables.api.fnSetFilteringDelay.js", "vendor/assets/javascripts/dataTables/jquery.dataTables.typeDetection.numbersHtml.js", "vendor/assets/javascripts/dataTables/jquery.dataTables.js", "vendor/assets/javascripts/dataTables/jquery.dataTables.api.fnReloadAjax.js", "vendor/assets/javascripts/dataTables/jquery.dataTables.api.fnFilterOnReturn.js", "vendor/assets/javascripts/dataTables/extras", "vendor/assets/javascripts/dataTables/extras/ColReorder.js", "vendor/assets/javascripts/dataTables/extras/FixedColumns.js", "vendor/assets/javascripts/dataTables/extras/AutoFill.js", "vendor/assets/javascripts/dataTables/extras/ZeroClipboard.js", "vendor/assets/javascripts/dataTables/extras/TableTools.min.js", "vendor/assets/javascripts/dataTables/extras/FixedHeader.js", "vendor/assets/javascripts/dataTables/extras/ColVis.js", "vendor/assets/javascripts/dataTables/extras/Scroller.js", "vendor/assets/javascripts/dataTables/extras/KeyTable.js", "vendor/assets/javascripts/dataTables/extras/TableTools.js", "vendor/assets/stylesheets", "vendor/assets/stylesheets/dataTables", "vendor/assets/stylesheets/dataTables/jquery.dataTables.bootstrap.css.scss", "vendor/assets/stylesheets/dataTables/src", "vendor/assets/stylesheets/dataTables/src/demo_table.css", "vendor/assets/stylesheets/dataTables/src/demo_page.css", "vendor/assets/stylesheets/dataTables/src/jquery.dataTables_themeroller.css", "vendor/assets/stylesheets/dataTables/src/demo_table_jui.css", "vendor/assets/stylesheets/dataTables/jquery.dataTables.css.scss", "vendor/assets/stylesheets/dataTables/extras", "vendor/assets/stylesheets/dataTables/extras/TableTools_JUI.css", "vendor/assets/stylesheets/dataTables/extras/TableTools.css"]
  s.homepage = "https://github.com/rweng/jquery-datatables-rails"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "jquery datatables for rails"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jquery-rails>, [">= 0"])
    else
      s.add_dependency(%q<jquery-rails>, [">= 0"])
    end
  else
    s.add_dependency(%q<jquery-rails>, [">= 0"])
  end
end
