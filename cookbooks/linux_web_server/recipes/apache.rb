#
# Cookbook Name:: linux_web_server
# Receipe:: apache
#

#include_recipe 'linux_web_server::firewall'

#if node['platform_family'] == "rhel"
#  package = 'httpd'
#elseif node['platform_family'] == "debian"
#  include_recipe 'apt'
#  package = 'apache2'
#end

# Install Apache
httpd_service 'default' do
  listen_addresses ['127.0.0.1']
  listen_ports ['81']
  action [:create, :stop]
end
