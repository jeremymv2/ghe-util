# Author: Justin Schuhmann
# Cookbook Name:: ghe-util
# Recipe:: restore
#
# Copyright 2014, Justin Schuhmann
#
# All rights reserved - Do Not Redistribute
#

script "restore" do
  interpreter "bash"
  user "root"
  cwd node["ghe-util"]["root_dir"]
  code <<-EOH
  bin/ghe-restore
  EOH
  only_if has_ssh?
end