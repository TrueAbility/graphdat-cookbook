#
# Cookbook Name:: graphdat
# Recipe:: default
#
# Copyright 2013, TrueAbility, Inc.
#

if platform_family?("debian")
  require_recipe "apt"

  apt_repository "graphdat" do
    uri "http://apt.graphdat.com"
    distribution node['lsb']['codename']
    components ["non-free"]
    keyserver "subkeys.pgp.net"
    key "0FC6984B"
  end
  
### FIX ME: Add support for other platform_families  
# elsif platform_family?("rhel")

end


package "graphdat-agent" do
  action :install
end

template "/etc/graphdat.conf" do
  source "graphdat.conf.erb"
  mode 0640
  owner "root"
  group "root"
end

service "graphdat" do
  supports :status => true, :restart => true
  action [ :enable, :restart ]
end
