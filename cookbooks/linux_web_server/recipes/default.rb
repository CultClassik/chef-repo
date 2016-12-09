# Cookbook Name:: linux_web_server
# Recipe:: default
#
# Chris Diehl

#if node["platform"] == "ubuntu" do
#  include_recipe 'apt::default'

#end

#if node["platform"] == "rhel" do
#  include_recipe 'yum::epel'

#end

#include_recipe 'linux_server::default'
