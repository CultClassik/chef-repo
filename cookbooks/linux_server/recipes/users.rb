#
# Recipe:: users
#
# Copyright (c) 2016 Diehlabs, All Rights Reserved.

# user vagrant should be included in the base vm image, for lab purposes we leave it alone - remove the account for production

# add user chris to sudoers on all systems and deploy the public ssh key

#users_manage "media_rw" do
#  group_id 1005
#  action [ :remove, :create ]
#end

#search(:users, "*.*").each do |user|
users = data_bag('users')

users.each do |account|
  user = data_bag_item('users', account)

  home = "/home/${account}"

  #users_manage account do
  user account do
    uid       user["uid"]
    gid       user["gid"]
    shell     user["shell"]
    #ssh_public_key  user["ssh_keys"]
    home      home
    action    [:modify, :create]
  end
end
