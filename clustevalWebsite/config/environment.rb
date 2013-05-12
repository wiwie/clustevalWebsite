# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
ClustEval::Application.initialize! do |config|
	config.gem 'authlogic'
end

require 'rubygems'
require 'rails_sql_views'
require 'composite_primary_keys'