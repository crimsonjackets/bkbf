require "rvm/capistrano"
require 'bundler/capistrano'
set :rvm_ruby_string, "2.1.0"
set :assets_role, :app
set :normalize_asset_timestamps, false
set :application, "bkbf"

set :scm, :git
# set :local_repository, "git@github.com:crimsonjackets/hyper.git"
# set :repository, "git@github-hyper:crimsonjackets/hyper.git"
set :branch, :master
set :deploy_via, :remote_cache
set :ssh_options, { forward_agent: true }

set :user, "rails"
set :deploy_to, "/home/rails/#{application}"
set :shared_children,   %w(public/system public/files public/uploads log tmp/pids tmp/sockets)
set :use_sudo,  false

task :production do
  role :web, "188.226.244.217"
  role :app, "188.226.244.217"
  role :db,  "188.226.244.217", primary: true

  set :branch, :master
  set :deploy_to, "/home/rails/#{application}"
  set :rails_env, 'production'
end

# Just for fun
##after 'deploy' do
#   #`say Master, deployed complete!`
#end

set :keep_releases, 3
before "db:symlink", "deploy:setup_config"
after "deploy:update", "deploy:cleanup"
after "deploy:update_code", "db:symlink"
before "deploy:assets:precompile", "deploy:setup_config", "db:symlink"

namespace :db do
  desc "Make symlink for database yaml"
  task :symlink do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  desc "Rollback database"
  task :rollback, :roles => :db, :only => { :primary => true } do
    run "cd #{current_path}; bundle exec rake db:rollback RAILS_ENV=#{rails_env}"
  end
end

namespace :deploy do
  desc "Database config"
  task :setup_config, roles: :app do
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.yml"), "#{shared_path}/config/database.yml"
  end

  desc "Start unicorn"
  task :start, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path}; bundle exec unicorn -c config/unicorn.rb -E #{rails_env} -D -p 4005"
  end

  desc "Stop unicorn"
  task :stop, :roles => :app, :except => { :no_release => true } do
    run "kill -s QUIT `cat #{shared_path}/pids/unicorn.pid`"
  end
end
