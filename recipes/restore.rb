# Author: Justin Schuhmann
# Cookbook Name:: ghe-util
# Recipe:: restore
#
# Copyright 2014, Justin Schuhmann
#
# All rights reserved - Do Not Redistribute
#

ruby_block "restore ghe" do
  block do
    if ::GheUtil::Helper.has_ssh do
      ::GheUtil::Helper.restore_ghe
    end
  end
end