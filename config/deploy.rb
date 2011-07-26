set :application, "apartmentrent"

set :user, "houdini"
set :use_sudo, false
set :scm, :git
set :repository, "git://github.com/palam4ik/apartmentrent.git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/#{user}/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

set :domain, "houdini@188.127.228.220"

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

namespace :deploy do
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end
