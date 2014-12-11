# Author: Justin Schuhmann
# Cookbook Name:: ghe-util
# Recipe:: backup
#
# Copyright 2014, Justin Schuhmann
#
# All rights reserved - Do Not Redistribute
#

script "backup" do
  interpreter "bash"
  user "root"
  cwd node["ghe-util"]["root_dir"]
  code <<-EOH
  bin/ghe-backup
  EOH
  only_if has_ssh?
end