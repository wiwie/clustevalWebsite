role :web, "bsubtilis"                          # Your HTTP server, Apache/etc
role :app, "bsubtilis"                          # This may be the same as your `Web` server
role :db,  "bsubtilis", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

set :user, 'wiwie' # bsubtilis username
set :gateway, 'wiwiec@contact.mmci.uni-saarland.de' # contains username for gateway
set :deploy_to, "/local/wiwie/ClustEval" # here capistrano should store all the different releases
# set :current_path, '/local/ClustEval' # and this is the target directory, that should point to the current release
set :use_sudo, false
# set :verbose, Logger::DEBUG
# ssh_options[:forward_agent] = true

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
namespace :deploy do
  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
  end
end