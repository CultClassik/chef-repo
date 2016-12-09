#
# Cookbook Name:: linux_web_server
# Receipe:: nginx
#

# Install Apache and start the service on RHEL/CentOS or Debian/Ubuntu
#if node['platform_family'] == "rhel"
  #package = 'httpd'
  #include_recipe[yum::epel]
#elseif node['platform_family'] == "debian"
  #package = 'apache2'
  #include_recipe[apt::default]
#end

#yum_repository '*' do
#  action :makecache
#end

nodeName = node["fqdn"]
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

# dynamically create each web site / vhost - this is for testing, for production move these to a separate receipe specific to the web app being deployed
node["webserver"]["sites"].each do |siteName, siteParams|
  documentRoot = "/var/www/#{siteName}"

  # create the document root for the site
  directory documentRoot do
    mode '0755'
    recursive true
  end

  # create a sample index page for the site
  file "#{documentRoot}/index.html" do
    mode '0755'
    content "<html>Welcome to website #{siteName} running on #{nodeName}</html>"
  end

  # create the vhost config for the site
  template "/etc/nginx/conf.d/#{siteName}.conf" do
    source "nginx_vhost.conf.erb"
    mode "0644"
    variables(
      :siteName => siteName,
      :serverName => node["webserver"]["sites"][siteName]["serverName"],
      :port => node["webserver"]["sites"][siteName]["port"],
      :documentRoot => documentRoot
    )
    notifies :restart, "service[nginx]"
  end
  # restart nginx

end


#template '' do
#end
