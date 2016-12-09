#
# Cookbook Name:: linux_web_server
# Receipe:: nginx
#
include_recipe 'linux_web_server::firewall'

# Install Apache and start the service on RHEL/CentOS or Debian/Ubuntu
#if node['platform_family'] == "rhel"
  #package = 'httpd'
  #include_recipe[yum::epel]

# if node is running debian variant run apt-get update
if node['platform_family'] == "debian"
  include_recipe 'apt'
end

vHostDir = '/etc/nginx/conf.d/'

# install nginx web server
package 'nginx' do
  action [:install]
end

# enable and start the nginx service
service 'nginx' do
  action [:enable, :start]
end

# replace the default nginx.conf with a basic copy that contains no website definitions
template '/etc/nginx/nginx.conf' do
  source "nginx.conf.erb"
  mode "0644"
  variables(
    :vHostDir => "#{vHostDir}*.conf",
  )
end
