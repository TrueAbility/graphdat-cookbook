name             'graphdat'
maintainer       'TrueAbility, Inc.'
maintainer_email 'ops@trueability.com'
license          'BSD-three-clause'
description      'Installs/Configures Graphdat Agent'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{ ubuntu debian}.each do |os|
  supports os
end

depends "apt"