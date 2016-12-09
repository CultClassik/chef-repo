name 'linux_server'
maintainer 'Chris Diehl'
maintainer_email 'chris@diehlabs.com'
license 'all_rights'
description 'Installs/Configures linux_server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.40'

depends 'users'
depends 'sudo'
depends 'apt', '~> 4.0'
depends 'yum-epel', '~> 2.0.0'
depends 'chef-client', '~> 7.0.3'

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Issues` link
# issues_url 'https://github.com/<insert_org_here>/linux_server/issues' if respond_to?(:issues_url)
