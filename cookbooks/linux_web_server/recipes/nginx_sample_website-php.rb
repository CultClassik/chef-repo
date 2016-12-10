#
# Cookbook Name:: linux_web_server
# Receipe:: nginx_sample_website-php
#
# This receipe will create two sample PHP websites on the nginx server.
# Use this receipe as a template for deploying actual websites.

# When deploying an actual website be sure to add a section to install php modules as required

include_recipe 'linux_web_server::nginx_php'

nodeName = node["fqdn"]

# dynamically create each web site / vhost - this is for testing, for production move these to a separate receipe specific to the web app being deployed
node["webserver"]["sites"].each do |siteName, siteParams|
  documentRoot = "/var/www/#{siteName}"

  # create the document root for the site
  directory documentRoot do
    mode '0755'
    recursive true
  end

  # create a sample index page for the site
  file "#{documentRoot}/index.php" do
    mode '0755'
    content "<html>Welcome to website <b>#{siteName}</b> running on <b>#{nodeName}</b> with <b>Nginx</b>.<p /></html><?php phpinfo() ?>"
  end

  # create the vhost config for the site
  template "/etc/nginx/conf.d/#{siteName}.conf" do
    source "nginx_vhost.conf_php.erb"
    mode "0644"
    variables(
      :siteName => siteName,
      :serverName => node["webserver"]["sites"][siteName]["serverName"],
      :port => node["webserver"]["sites"][siteName]["port"],
      :documentRoot => documentRoot
    )
    # restart nginx
    notifies :restart, "service[nginx]"
  end
end
