# Author: Justin Schuhmann
# Cookbook Name:: ghe-util
# Recipe:: install
#
# Copyright 2014, Justin Schuhmann
#
# All rights reserved - Do Not Redistribute
#
include_recipe "git"

#copy down github files for GitHub Enterprise Util
git node["ghe-util"]["root_dir"] do
  checkout_branch 'master'
  repository 'https://github.com/github/backup-utils.git'
  action :sync
end

# Create backup.config file from template
template "#{node["ghe-util"]["root_dir"]}/backup.config" do
  source "backup.config.erb"
  mode '0440'
  owner 'root'
  group 'root'
  variables({
    :hostname => node["ghe-util"]["hostname"],
    :data_directory => node["ghe-util"]["data_directory"],
    :number_of_snapshots => node["ghe-util"]["number_of_snapshots"],
    :restore_hostname => node["ghe-util"]["restore_hostname"],
    :extra_ssh_options => node["ghe-util"]["extra_ssh_options"]
  })
end

# Create SSH directory if it doesn't exist
directory "/root/.ssh" do
  owner "root"
  group "root"
  mode "0700"
  action :create
end

user_data_bag = chef_vault_item("ssh", "keys")
public_key = user_data_bag["public"]
private_key = user_data_bag["private"]

# Create private key file from template
template "/root/.ssh/github_admin_ssh" do
  source "github_admin_ssh.erb"
  mode '600'
  owner 'root'
  group 'root'
  variables({
     :github_admin_ssh_private_key => private_key
  })
end

# Create public key file from template
template "/root/.ssh/github_admin_ssh.pub" do
  source "github_admin_ssh.pub.erb"
  mode '644'
  owner 'root'
  group 'root'
  variables({
     :github_admin_ssh_public_key => public_key
  })
end