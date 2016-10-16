def random_password
  require 'securerandom'
  SecureRandom.base64
end

normal_unless['awesome_customers_database']['database']['root_password'] = random_password
normal_unless['awesome_customers_database']['database']['admin_password'] = random_password
default['awesome_customers_database']['database']['dbname'] = 'my_company'
default['awesome_customers_database']['database']['host'] = '127.0.0.1'
default['awesome_customers_database']['database']['root_username'] = 'root'
default['awesome_customers_database']['database']['admin_username'] = 'db_admin'
