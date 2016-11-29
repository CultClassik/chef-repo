#
# Cookbook Name:: linux_server
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'linux_server::motd'
include_recipe 'linux_server::users'
