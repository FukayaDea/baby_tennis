# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "baby_tennis"
set :repo_url, "git@github.com:FukayaDea/baby_tennis.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, 'master'

# Default deploy_to directory is /var/www/my_app_name
 set :deploy_to, "/var/www/baby_tennis"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
 set :pty, true

# Default value for :linked_files is []
 append :linked_files, "config/master.key"

# Default value for linked_dirs is []
 append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
 set :keep_releases, 5

 set :rbenv_ruby, '2.5.1'
 set :log_level, :debug


namespace :deploy do

  # task :init_permission do
  #   on release_roles :all do
  #     execute :sudo, :chown, '-R', "#{fetch(:user)}:#{fetch(:group)}", deploy_to
  #   end
  # end

  # task :reset_permission do
  #   on release_roles :all do
  #     execute :sudo, :chown, '-R', "nginx:nginx", deploy_to
  #   end
  # end

  # unicornの再起動
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end

  # データベースの作成
  desc 'Create database'
  task :db_create do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
                  # データベース作成のsqlセット
                # データベース名はdatabase.ymlに設定した名前で
                  sql = "CREATE DATABASE IF NOT EXISTS baby_tennis_production;"
                  # クエリの実行。
                # userとpasswordはmysqlの設定に合わせて
                execute "mysql --user=root --password=mbcfZ572_ -e '#{sql}'"

        end
      end
    end
  end

#  before :starting, :init_permission

  after :publishing, :restart

#  after :finished, :reset_permission

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end
end

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
