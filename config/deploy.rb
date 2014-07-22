# config valid only for Capistrano 3.1
load "deploy"                    #precompile all the css, js and images... before deployment..
require "bundler/capistrano"            # install all the new missing plugins...
require 'capistrano/ext/multistage'     # deploy on all the servers..
require "rvm/capistrano"                # if you are using rvm on your server..

set :stages, ["staging", "production"]
##           # install all the new missing plugins...
##require 'capistrano/ext/multistage'     # deploy on all the servers..
set :default_stage, "staging"
set :application, 'project_management'
server "107.170.153.145",  roles: [:app, :web, :db], :primary => true
set :deploy_to, "/var/www/project-management1"
set :scm, :git
set :repo_url, 'https://github.com/sweetymehta/project-management1.git'
set :branch, 'master'
set :user, "sweety"

task :hello do
  puts 'hello'
  run "#{sudo} echo 'Hello' > ~/hello"
end

#namespace :deploy do
#
#  desc 'Restart application'
#  task :restart do
#    on roles(:app), in: :sequence, wait: 5 do
#      # Your restart mechanism here, for example:
#      # execute :touch, release_path.join('tmp/restart.txt')
#    end
#  end
#
#  after :publishing, :restart
#
#  after :restart, :clear_cache do
#    on roles(:web), in: :groups, limit: 3, wait: 10 do
#      # Here we can do anything such as:
#      # within release_path do
#      #   execute :rake, 'cache:clear'
#      # end
#    end
#  end
#
#end
