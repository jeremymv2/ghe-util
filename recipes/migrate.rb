# Author: Justin Schuhmann
# Cookbook Name:: ghe-util
# Recipe:: migrate
#
# Copyright 2014, Justin Schuhmann
#
# All rights reserved - Do Not Redistribute
#

ruby_block "migrating ghe" do
  block do
    if has_ssh?
      maintence_mode(true)

      script "backup" do
        interpreter "bash"
        user "root"
        cwd node["ghe-util"]["root_dir"]
        code <<-EOH
        bin/ghe-backup
        EOH
      end

      script "restore" do
        interpreter "bash"
        user "root"
        cwd node["ghe-util"]["root_dir"]
        code <<-EOH
        bin/ghe-restore
        EOH
      end

      #TODO: Change the DNS/Canabalize the IP of old GitHub Server...
    end
  end
end
