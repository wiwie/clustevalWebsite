
module RailsSqlViews
  module Loader
    SUPPORTED_ADAPTERS = %w( Mysql Mysql2 PostgreSQL SQLServer SQLite OracleEnhanced )

    def self.load_extensions
      SUPPORTED_ADAPTERS.each do |db|
        if ActiveRecord::ConnectionAdapters.const_defined?("#{db}Adapter")
          require "rails_sql_views/connection_adapters/#{db.downcase}_adapter"
          ActiveRecord::ConnectionAdapters.const_get("#{db}Adapter").class_eval do
            include RailsSqlViews::ConnectionAdapters::AbstractAdapter
            include RailsSqlViews::ConnectionAdapters.const_get("#{db}Adapter")
            # prevent reloading extension when the environment is reloaded
            $rails_sql_views_included = true
          end
        end
      end
    end
  end
end
