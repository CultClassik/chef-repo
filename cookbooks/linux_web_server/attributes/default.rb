default["webserver"]["sites"]["defaultSite"] = {
  "serverName" => node['fqdn'],
  "port" => 80,
  "user" => "defaultSiteUser",
  "group" => "defaultSiteGroup"
}

default["webserver"]["sites"]["testSite"] = {
  "serverName" => node['ipaddress'],
  "port" => 8080,
  "user" => "testSiteUser",
  "group" => "testSiteGroup"
}
