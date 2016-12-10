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

# Install Apache and start the service on RHEL/CentOS or Debian/Ubuntu
httpd_service 'default' do
  action [:create, :start]
end
