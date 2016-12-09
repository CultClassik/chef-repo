name 'linux_web_server'
maintainer 'Chris Diehl'
maintainer_email 'chris@diehlabs.com'
license 'all_rights'
description 'Installs/Configures linux_web_server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.32'

#depends 'apt', '~> 4.0'
depends 'yum', '~> 4.1.0'
depends 'firewall', '~> 2.4'
#depends 'httpd', '~> 0.4'
#depends 'nginx', '~> 2.7.6'
