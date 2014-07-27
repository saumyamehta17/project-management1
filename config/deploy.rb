  # config valid only for Capistrano 3.1
#load "deploy"                    #precompile all the css, js and images... before deployment..
#require "bundler/capistrano"            # install all the new missing plugins...
#require 'capistrano/ext/multistage'     # deploy on all the servers..
#require "rvm/capistrano"                # if you are using rvm on your server..
#require 'capistrano/deploy'
set :stages, ["staging", "production"]
set :default_stage, "staging"
set :stages, %w(production staging)     #various environments
load "deploy/assets"                    #precompile all the css, js and images... before deployment..
require "bundler/capistrano"            # install all the new missing plugins...
#require 'capistrano/ext/multistage'     # deploy on all the servers..
require "capistrano/rails"                # if you are using rvm on your server..
#require './config/boot'
#require 'airbrake/capistrano'
# require "capistrano-resque"             # load this for delayed job..
#  require "whenever/capistrano"
# require './config/boot'
# require 'thinking_sphinx/deploy/capistrano'

  before "deploy:assets:precompile","deploy:config_symlink"
#before "deploy:update_code",    "delayed_job:stop"  # stop the previous deployed job workers...
# Staging Ip-> 198.211.117.169
# Production IP -> 198.199.74.57
# role :resque_worker, "192.241.213.121"
# role :resque_scheduler, "192.241.213.121"

#set :workers, { "*" => 2 }
  after "deploy:update", "deploy:cleanup" #clean up temp files etc.
# after "deploy:update_code", "deploy:carrierwave"
  after "deploy:update_code","deploy:migrate"
# after "deploy:update_code", "thinking_sphinx:rebuild"
#after "deploy:start",   "delayed_job:start" #start the delayed job
#after "deploy:restart", "delayed_job:restart" # restart it..
# after "deploy:restart", "resque:restart"
#  set :whenever_command, "bundle exec whenever"
  set :application, 'project_management'
# set :delayed_job_args, "-n 2"            # number of delayed job workers
#  set :rvm_ruby_string, '2.0.0'             # ruby version you are using...
#  set :rvm_type, :user
#  set :whenever_environment, defer { stage }  # whenever gem for cron jobs...
#  set :whenever_identifier, defer { "#{application}_#{stage}" }
  server "107.170.153.145", :app, :web, :db, :primary => true
  set set :deploy_to, "/var/www/project-management1"
  set :user, 'sweety'
  set :keep_releases, 3
  set :scm, :git
 set :repo_url, 'https://github.com/sweetymehta/project-management1.git'
  #set :use_sudo, false
  #set :scm, :g

#set :application, 'project_management'
#server "107.170.153.145",  roles: [:app, :web, :db], :primary => true
#set :deploy_to, "/var/www/project-management1"
#set :scm, :git
#set :repo_url, 'https://github.com/sweetymehta/project-management1.git'
#set :branch, 'master'
#set :user, 'deployer'

#task :hello do
#  puts 'hello'
#  run "#{sudo} echo 'Hello' > ~/hello"
#end

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
