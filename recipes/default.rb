#
# Cookbook:: node_3
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

# apt_update

apt_update 'update_sources' do

  action :update

end



#provision nginx

package 'nginx'

service 'nginx' do

  action [:enable, :start]

end



#provision nodejs and pm2




#syntax to move our file.

#template'destination'

#source 'name file_in_templates.conf.erb'

template '/etc/nginx/sites-available/proxy.conf' do
  source 'proxy.conf.erb'
  # variables(proxy_port: 3000,
  # proxy_port_2: 3030
  # notifies :restart, 'service[nginx]'
end



link '/etc/nginx/sites-enabled/proxy.conf' do

  to '/etc/nginx/sites-available/proxy.conf'

  notifies :restart, 'service[nginx]'

end



link '/etc/nginx/sites-enabled/default' do

  action :delete

  notifies :restart, 'service[nginx]'

end
