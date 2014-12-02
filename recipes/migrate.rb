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
    if ::GheUtil::Helper.has_ssh do
      ::GheUtil::Helper.maintence_mode(true)

      ::GheUtil::Helper.backup_ghe

      ::GheUtil::Helper.restore_ghe

      #TODO: Change the DNS/Canabalize the IP of old GitHub Server...
    end
  end
end
