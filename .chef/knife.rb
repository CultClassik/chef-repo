# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "chris"
client_key               "#{current_dir}/chris.pem"
chef_server_url          "https://chef.homelan/organizations/diehlabs"
cookbook_path            ["#{current_dir}/../cookbooks"]
knife[:editor] = "C:\\progra~2\\notepa~1\\notepad++.exe -nosession -multiInst"

