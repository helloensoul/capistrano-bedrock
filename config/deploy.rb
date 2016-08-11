# Project configuration
# =====================

# Set the name of the bedrock project folder
set :bedrock_folder, "example.com"

# Set the name of the trellis project folder
set :trellis_folder, "_trellis-example.com"

# Set the development domain [WITHOUT http(s)://]
set :development_domain, "example.dev"

# Set the staging domain [WITHOUT http(s)://]
set :staging_domain, "staging.example.com"

# Set the production domain [WITHOUT http(s)://]
set :production_domain, "example.com"

# Default capistrano-wpcli configuration
# ======================================

# Set the path (i.e. "log/capistrano.log") to save Capistrano's verbose output to a file or set to nil to disable completely
set :format_options, log_file: nil

# Set to true if you would like to create backups of databases on each push and pull
set :wpcli_backup_db, true

# Url of the WordPress root installation on the local server (used by search-replace command)
set :wpcli_local_url, -> {"//#{fetch(:development_domain)}"}

# Absolute or relative path to local directory for storing database backups which is read and writeable
set :wpcli_local_db_backup_dir, "_backup_database"

# Define dev role to connect to the local vagrant server
# [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
server "#{fetch(:development_domain)}", user: 'vagrant', roles: %w{dev},

ssh_options: {
  keys: ["../#{fetch(:trellis_folder)}/.vagrant/machines/default/virtualbox/private_key"],
  forward_agent: true,
  auth_methods: %w(publickey)
}

# Set the local vagrant development path where the project lives
set :dev_path, -> {"/srv/www/#{fetch(:bedrock_folder)}/current"}

# Absolute path to remote project folder to deploy
set :deploy_to, -> {"/srv/www/#{fetch(:bedrock_folder)}"}

# READ AND APPLY THE ISTRUCTIONS BELOW ONLY IF STAGING AND PRODUCTION ARE ON THE SAME SERVER
# These parameters need first to be moved into production.rb and staging.rb and then replace #{fetch(:bedrock_folder)} with the name of production and staging bedrock folder
# set :deploy_to, -> { "/srv/www/#{fetch(:bedrock_folder)}" }
# set :wpcli_remote_uploads_dir, -> { "/srv/www/#{fetch(:bedrock_folder)}/current/web/app/uploads/" }
