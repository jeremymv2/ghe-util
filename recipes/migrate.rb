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

      ::Chef::Recipe.send(:include, ::GheUtil::backup)
      ::Chef::Recipe.send(:include, ::GheUtil::restore)

      #TODO: Change the DNS/Canabalize the IP of old GitHub Server...
    end
  end
end
