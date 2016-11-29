#
# Recipe:: users
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

users_manage "media_rw" do
  group_id 1005
  action [ :remove, :create ]
end
