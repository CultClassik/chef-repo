# Cookbook Name:: linux_web_server
# Recipe:: default
#
# Chris Diehl


include_recipe 'apt::default'

if node["platform"] == "ubuntu"
  execute "apt-get update -y"
  end
end

include_recipe 'awesome_customers_ubuntu::firewall'
include_recipe 'awesome_customers_ubuntu::web_user'
include_recipe 'awesome_customers_ubuntu::web'
