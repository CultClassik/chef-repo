#
# Cookbook Name:: linux_web_server
# Receipe:: nginx_php
#

include_recipe 'linux_web_server::nginx'

# create fpm pool for each site
node["webserver"]["sites"].each do |siteName, siteConf|
  php_fpm_pool siteName do
    listen "/var/run/php5-fpm-#{siteName}.sock"
    # change the user and group for better separation
    #user "myWebUser"
    #group "myWebGroup"
    action :install
  end
end
