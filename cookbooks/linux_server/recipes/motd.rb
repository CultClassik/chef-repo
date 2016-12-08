hostname = node['hostname']
file '/etc/motd' do
  content "You are connected to #{hostname} at Diehlabs.\r\f"
end
