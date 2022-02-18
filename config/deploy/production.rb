server '18.176.195.123', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/root/.ssh/id_rsa'
