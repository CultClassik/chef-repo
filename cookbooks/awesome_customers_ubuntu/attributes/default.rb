default['firewall']['allow_ssh'] = true
default['awesome_customers_ubuntu']['open_ports'] = 80

default['awesome_customers_ubuntu']['user'] = 'web_admin'
default['awesome_customers_ubuntu']['group'] = 'web_admin'
default['awesome_customers_ubuntu']['document_root'] = '/var/www/customers/public_html'

default['awesome_customers_database']['database']['dbname'] = 'my_company'
default['awesome_customers_database']['database']['host'] = '192.168.1.110'
default['awesome_customers_database']['database']['admin_username'] = 'db_admin'
default['awesome_customers_database']['database']['admin_password'] = 'password'
