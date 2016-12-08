#
# Recipe:: groups
#
# Copyright (c) 2016 Diehlabs, All Rights Reserved.

search(:groups, "*.*").each do |group|
  group group["id"] do
    gid group["gid"]
  end
end

#node.default['authorization']['sudo']['passwordless'] = true
#include_recipe "sudo"
