server '18.176.195.123', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/workspace/langamer/.ssh/id_rsa'
