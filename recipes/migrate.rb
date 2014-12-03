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
    if has_ssh? do
      maintence_mode(true)

      backup_ghe

      restore_ghe

      #TODO: Change the DNS/Canabalize the IP of old GitHub Server...
    end
  end
end
