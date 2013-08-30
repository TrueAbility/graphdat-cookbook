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
    keyserver "apt.graphdat.com"
    key "0FC6984B"
  end
  
### FIX ME: Add support for other platform_families  
# elsif platform_family?("rhel")

end


package "graphdat-agent" do
  action :install
end

service "graphdat" do
  supports :status => true, :restart => true
  action [ :enable, :start ]
end

template "/etc/graphdat.conf" do
  source "graphdat.conf.erb"
  mode 0644
  owner "root"
  group "root"
  notifies :restart, "service[graphdat]", :delayed
end

