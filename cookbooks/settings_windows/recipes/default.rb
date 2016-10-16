#
# Cookbook Name:: settings_windows
# Recipe:: default
#
# Chris Diehl
directory 'C:/temp'

template 'C:/temp/server-info.txt' do
  source 'server-info.txt.erb'
end
