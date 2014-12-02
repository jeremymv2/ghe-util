# Author: Justin Schuhmann
# Cookbook Name:: ghe-util
# Recipe:: backup
#
# Copyright 2014, Justin Schuhmann
#
# All rights reserved - Do Not Redistribute
#

ruby_block "backup ghe" do
  block do
    if ::GheUtil::Helper.has_ssh do
      ::GheUtil::Helper.backup_ghe
    end
  end
end
