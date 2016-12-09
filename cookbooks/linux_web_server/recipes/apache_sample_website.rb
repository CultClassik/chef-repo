include_recipe 'awesome_customers_ubuntu::firewall'
include_recipe 'awesome_customers_ubuntu::web_user'
include_recipe 'awesome_customers_ubuntu::web'

# Install Apache and start the service on RHEL/CentOS or Debian/Ubuntu

if node['platform_family'] == "rhel"
  package = 'httpd'
elseif node['platform_family'] == "debian"
  package = 'apache2'
end

httpd_service 'customers' do
  mpm 'prefork'
  action [:create, :start]
end

# Add the site configuration.
httpd_config 'customers' do
  instance 'customers'
  source 'customers.conf.erb'
  notifies :restart, 'httpd_service[customers]'
end

# Create the document root directory.
directory node['apache']['document_root'] do
  recursive true
end

# Write the home page.
template "#{node['apache']['document_root']}/index.php" do
  source 'index.php.erb'
  mode '0644'
  owner node['awesome_customers_ubuntu']['user']
  group node['awesome_customers_ubuntu']['group']
end

# Install the mod_php5 Apache module.
httpd_module 'php5' do
  instance 'customers'
end

# Install php5-mysql.
package 'php5-mysql' do
  action :install
  notifies :restart, 'httpd_service[customers]'
end
