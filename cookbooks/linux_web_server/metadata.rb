name 'linux_web_server'
maintainer 'Chris Diehl'
maintainer_email 'chris@diehlabs.com'
license 'all_rights'
description 'Installs/Configures a web server on Linux hosts'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.34'

depends 'yum', '~> 4.1.0'
depends 'firewall', '~> 2.4'
depends 'php', '~> 2.1.1'
