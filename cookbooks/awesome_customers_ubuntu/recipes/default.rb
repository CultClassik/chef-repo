# Cookbook Name:: awesome_customers_ubuntu
# Recipe:: default
#
# Chris Diehl

include_recipe 'apt::default'
include_recipe 'awesome_customers_ubuntu::firewall'
include_recipe 'awesome_customers_ubuntu::web_user'
include_recipe 'awesome_customers_ubuntu::web'
