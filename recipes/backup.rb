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
    if has_ssh?
      backup_ghe
    end
  end
end
