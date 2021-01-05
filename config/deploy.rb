set :application, "liamapp"
set :repo_url, "https://git-codecommit.us-west-2.amazonaws.com/v1/repos/liamapp"
set :git_http_username, "adam-at-853966159284"
set :git_http_password, "c2XTupGYK/cATXUOS3KdDs7t7E5oyF07RDDbvgh45RQ="
set :branch, "master"
set :bundle_flags, "--deployment"

# Deploy to the user's home directory
set :deploy_to, "/home/ubuntu/liamapp"


# set :rsync_cmd, "rsync -ave 'ssh -i ~/.ssh/nw_cloud_dev_key.pem' --delete"
set :use_sudo, true

set :pty, true

set :ssh_options, {
  forward_agent: true,
  user: "ubuntu",
  keys: %w[~/.ssh/nw_cloud_dev_key.pem]
}

set :linked_files, %w{config/master.key}
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')



append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'



# Only keep the last 5 releases to save disk space
# set :keep_releases, 5

# Optionally, you can symlink your database.yml and/or secrets.yml file from the shared directory during deploy
# This is useful if you don't want to use ENV variables
# append :linked_files, 'config/database.yml', 'config/secrets.yml'