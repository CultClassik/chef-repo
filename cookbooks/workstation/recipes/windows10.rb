#
# Cookbook Name:: workstation
# Recipe:: windows10
#
# Copyright (c) 2016 Diehlabs, All Rights Reserved.

include_recipe 'chocolatey'

node["choco"]["pkgs"].each do |p|
  chocolatey_package p do
    action :install
  end
end
