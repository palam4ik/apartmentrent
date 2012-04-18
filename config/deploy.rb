set :application, "apartmentrent"

set :user, "hosting_houdini"
set :use_sudo, false
set :scm, :git
set :repository, "git://github.com/palam4ik/apartmentrent.git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/#{user}/projects/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

set :domain, "locum"

role :app, domain
role :web, domain
role :db,  domain, :primary => true

set :rails_env, 'production'

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

after "deploy:update_code", "db:symlink"

namespace :db do
  desc "Make symlink for database yaml"
  task :symlink do
    run "ln -nfs #{shared_path}/config/database.yml #{current_path}/config/database.yml"
  end
end

set :login, "houdini"
set :unicorn_rails, "/var/lib/gems/1.8/bin/unicorn_rails"
set :unicorn_conf, "/etc/unicorn/#{application}.#{login}.rb"
set :unicorn_pid, "/var/run/unicorn/#{application}.#{login}.pid"

# - for unicorn - #
namespace :deploy do
  desc "Start application"
  task :start, :roles => :app do
    run "#{unicorn_rails} -Dc #{unicorn_conf}"
  end

  desc "Stop application"
  task :stop, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -USR2 `cat #{unicorn_pid}` || #{unicorn_rails} -Dc #{unicorn_conf}"
  end
end
