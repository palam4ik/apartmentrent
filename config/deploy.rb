require "rvm/capistrano"
require "bundler/capistrano"
load 'deploy/assets'

set :user, "hosting_houdini"
set :default_environment, {
  'GEM_HOME'     => "/home/#{user}/gems",
  'GEM_PATH'     => "/home/#{user}/gems",
}

set :application, "apartmentrent"

set :login, "houdini"
set :use_sudo, false
set :scm, :git
set :repository, "git://github.com/palam4ik/apartmentrent.git"
set :bundle_without,  [:development, :test]


set :deploy_to,       "/home/#{user}/projects/#{application}"
set :unicorn_conf,    "/etc/unicorn/#{application}.#{login}.rb"
set :unicorn_pid,     "/var/run/unicorn/#{application}.#{login}.pid"
set :bundle_dir,      File.join(fetch(:shared_path), 'gems')

set :domain, "locum"

role :app, domain
role :web, domain
role :db,  domain, :primary => true

set :rails_env, 'production'

set :rvm_ruby_string, "1.9.3"
set :rake,            "rvm use #{rvm_ruby_string} do bundle exec rake"
set :bundle_cmd,      "rvm use #{rvm_ruby_string} do bundle"

after "deploy:update_code", "symlink_files"

task :symlink_files do
  ['photos', 'uploads'].each do |folder|
    path  = "#{release_path}/../../shared/files/#{folder}"
    symlink_path = "#{release_path}/public/#{folder}"
    run "mkdir -p \"#{path}\""
    puts "Symlinking #{folder} folder"
    run "rm -rf \"#{symlink_path}\""
    run "ln -sf \"#{path}\" \"#{symlink_path}\""
  end

  ['log'].each do |log|
    path  = "#{release_path}/../../shared/#{log}"
    symlink_path = "#{release_path}/#{log}"
    run "mkdir -p \"#{path}\""
    run "echo \"\" >> #{path}/production.log"
    puts "Symlinking #{log} folder"
    run "rm -rf \"#{symlink_path}\""
    run "ln -sf \"#{path}\" \"#{symlink_path}\""
  end

  database_yml = "#{release_path}/../../shared/config/database.yml"
  run "cp -sf #{database_yml} #{release_path}/config"
end

before "deploy:assets:precompile", "db:symlink"

namespace :db do
  desc "Make symlink for database yaml"
  task :symlink do
    run "cp #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

set :unicorn_start_cmd, "(cd #{deploy_to}/current; rvm use #{rvm_ruby_string} do bundle exec unicorn_rails -Dc #{unicorn_conf})"

# - for unicorn - #
namespace :deploy do
  desc "Start application"
  task :start, :roles => :app do
    run unicorn_start_cmd
  end

  desc "Stop application"
  task :stop, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -USR2 `cat #{unicorn_pid}` || #{unicorn_start_cmd}"
  end
end
