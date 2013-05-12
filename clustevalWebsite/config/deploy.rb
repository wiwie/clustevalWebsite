set :stages, %w(production staging)
set :default_stage, "staging"
require "bundler/capistrano"
require 'capistrano/ext/multistage'

default_run_options[:pty] = true
set :application, "website_rails"
set :scm, 'subversion'
set :repository,  "https://wiwiec@svn.csb.mpi-inf.mpg.de/CSB/ClustEval/website_rails/"

after "deploy", "deploy:migrate"
