#
# Cookbook Name:: linux_server
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'linux_server::motd'
include_recipe 'linux_server::users'
include_recipe 'linux_server::groups'
include_recipe 'linux_server::chef_client_conf'

# centos/rhel specific
if node['platform_family'] == "rhel"

  # delete the media repo - leftover from dvd source install
  yum_repository 'CentOS-Media' do
    action :delete
  end

  # add the epel repo
  yum_repository 'epel' do
    mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-7&arch=$basearch'
    description 'Extra Packages for Enterprise Linux 7 - $basearch'
    enabled true
    gpgcheck true
    gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7'
  end
end

# debian/ubuntu specific
