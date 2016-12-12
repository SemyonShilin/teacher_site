# config valid only for current version of Capistrano
lock "3.7.0"

set :application, "teacher_site"
set :repo_url, "git@github.com:ShilinSemyon/teacher_site.git"

set :docker_role, :app
set :docker_compose, true
set :docker_compose_project_name, fetch(:application)

namespace :docker do
  namespace :compose do
    task :bundle do
      on roles(:app) do
        within release_path do
          execute :"docker-compose", compose_run_command(:app, "bundle install --without development test --jobs $(nproc) --path=/usr/local/bundle")
        end
      end
    end
    task :migrate do
      on roles(:db) do
        within release_path do
          execute :"docker-compose", compose_run_command(:app, "bundle exec rails db:migrate")
        end
      end
    end
    task :assets do
      on roles(:app) do
        within release_path do
          execute :"docker-compose", compose_run_command(:app, "bundle exec rake assets:precompile")
        end
      end
    end
  end
  def compose_run_command(service, command); ["run", "--rm", "--no-deps", service, command].join(" "); end
end

before "docker:deploy:compose:start", "docker:compose:assets"
before "docker:compose:assets", "docker:compose:migrate"
before "docker:compose:migrate", "docker:compose:bundle"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
