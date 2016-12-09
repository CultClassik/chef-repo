
# Cookbook Name:: linux_web_server
# Recipe:: firewall
#
# Chris Diehl
include_recipe 'firewall::default'

ports = []

node["webserver"]["sites"].each do |siteName|
  ports.push(node["webserver"]["sites"][siteName]["port"])
end

firewall_rule "open ports #{ports}" do
  port ports
end
