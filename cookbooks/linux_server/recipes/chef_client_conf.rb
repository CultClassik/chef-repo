#
# Cookbook Name:: linux_server
# Recipe:: chef_client_conf
#
# Copyright (c) 2016 Diehlabs, All Rights Reserved.

require 'chef-client', '~> 7.0.3'

include_recipe 'chef-client::delete_validation'
include_recipe 'chef-client::cron'
include_recipe 'chef-client'
