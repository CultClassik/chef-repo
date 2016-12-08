name 'workstation'
maintainer 'Chris Diehl'
maintainer_email 'chris@diehlabs.com'
license 'all_rights'
description 'Installs/Configures workstation'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.14'

depends 'windows', '~> 1.38'
depends 'chocolatey', '~> 1.0.3'
depends 'chocolatey-ohai-plugin', '~> 0.1.0'
