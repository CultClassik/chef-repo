default["webserver"]["sites"]["defaultSite"] = {
  "serverName" => node['fqdn'],
  "port" => 80,
  "user" => "testuser"
}

default["webserver"]["sites"]["testSite"] = {
  "serverName" => node['ipaddress'],
  "port" => 8080,
  "user" => "testuser"
}
