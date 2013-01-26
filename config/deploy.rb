require 'capistrano_colors'
require "bundler/capistrano"

# repo :)
set :application, "chairs"
set :scm,         :git
set :repository,  "https://github.com/osamunmun/chairs.git"
set :branch,      "master"

# server
set :deploy_to, "/usr/share/nginx/www"
set :use_sudo,  true
set :user,      (ENV['DEPLOY_USER'] ||= "#{ENV['USER']}")
set :ssh_key,   (ENV['DEPLOY_KEYS'] ||= "#{ENV['HOME']}/.ssh/id_rsa")
ssh_options[:keys]          = [ssh_key]
ssh_options[:auth_methods]  = %w[publickey]
ssh_options[:forward_agent] = true # ask password
default_run_options[:pty]   = true

# application
set :rails_env, "production"

role :web, ENV['PRODUCTION_SERVER']
role :app, ENV['PRODUCTION_SERVER']
role :db,  ENV['PRODUCTION_SERVER'], :primary => true
#role :db,  ""


after "deploy:create_symlink", "deploy:set_dot_env"
after "deploy:restart",        "deploy:cleanup"

# deploy (unicorn via foreman)
namespace :deploy do
  task :start, :roles => :app do
    run "cd #{current_path}; bundle exec foreman start web-production"
  end
  task :restart, :roles => :app do
    current_pid = "#{current_path}/tmp/pids/unicorn.pid"
    if File.exist? current_pid
      run "kill -s USR2 `cat #{current_pid}`"
    end
  end
  task :stop, :roles => :app do
    run "kill -s QUIT `cat #{current_pid}`"
  end
  task :set_dot_env, :roles => :app do
    run "cp #{shared_path}/.env #{current_path}/"
  end
end

# assets
namespace :assets do
  task :precompile, :roles => :web do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} rake assets:precompile"
  end
  task :cleanup, :roles => :web do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} rake assets:clean"
  end
end
after :deploy, "assets:precompile"