#
# Cookbook Name:: linux_web_server
# Receipe:: apache_sample_website
#

#include_recipe 'linux_web_server::apache'

nodeName = node["fqdn"]

# dynamically create each web site / vhost - this is for testing, for production move these to a separate receipe specific to the web app being deployed
node["webserver"]["sites"].each do |siteName, siteParams|
  documentRoot = "/var/www/#{siteName}"

  # create the document root for the site
  directory documentRoot do
    mode '0755'
    recursive true
  end

  httpd_service "#{siteName}" do
    instance siteName
    servername node["webserver"]["sites"][siteName]["serverName"]
    version '2.4'
    mpm 'event'
    threadlimit '4096'
    # port is stored as string attribute, put brackets around it so we're passing an array as required to listen_ports method
    listen_ports [node["webserver"]["sites"][siteName]["port"]]
    # set the user and group for better separation
    #run_user "myUser"
    #run_group "myGroup"
    #
    # enable modules as needed, probably best to define them as attributes
    # modules []
    action [:create, :start]
  end

  httpd_config "#{siteName}" do
    instance siteName
    source 'apache_vhost.conf.erb'
    #notifies :restart, 'httpd_service[customers]'
    variables(
          :siteName => siteName,
          :serverName => node["webserver"]["sites"][siteName]["serverName"],
          :port => node["webserver"]["sites"][siteName]["port"],
          :documentRoot => documentRoot
        )
  end

  # create a sample index page for the site
  file "#{documentRoot}/index.html" do
    mode '0755'
    content "<html>Welcome to website <b>#{siteName}</b> running on <b>#{nodeName}</b> with <b>Apache</b>.</html>"
    notifies :restart, "httpd_service[#{siteName}]"
  end

end
