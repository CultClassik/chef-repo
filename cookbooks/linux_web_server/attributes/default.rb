default["webserver"]["sites"]["defaultSite"] = {
  "serverName" => node['fqdn'],
  "port" => 80
}

default["webserver"]["sites"]["testSite"] = {
  "serverName" => node['ipaddress'],
  "port" => 8080
}
