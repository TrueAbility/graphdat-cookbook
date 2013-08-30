#
# Cookbook Name:: graphdat
# Recipe:: default
#
# Copyright 2013, TrueAbility, Inc.
#

directory "/var/lib/graphdat" do
  owner "root"
  group "root"
  mode 0755
  action :create
end

if platform_family?("debian")
  require_recipe "apt"

  apt_repository "graphdat" do
    uri "http://apt.graphdat.com"
    distribution node['lsb']['codename']
    components ["non-free"]
  end

  cookbook_file "graphdat.gpg.apt" do
    path "/var/lib/graphdat/graphdat.gpg.apt"
    action :create
  end

  execute "add apt gpg key" do
    command "apt-key add /var/lib/graphdat/graphdat.gpg.apt"
    action :run
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

