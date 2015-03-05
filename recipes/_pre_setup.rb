# encoding: utf-8

# Generate a password for the database user
::Chef::Recipe.send(:include, Opscode::OpenSSL::Password)
node.set_unless['roundcube']['database']['password'] = secure_password

# Destination directory for Roundcube
directory node['roundcube']['destination'] do
  user node['roundcube']['workdir']['user']
  group node['roundcube']['workdir']['group']
  mode '755'
  recursive true
end
