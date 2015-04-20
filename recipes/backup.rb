# Author: Justin Schuhmann
# Cookbook Name:: ghe-util
# Recipe:: backup
#
# Copyright 2014, Justin Schuhmann
#
# All rights reserved - Do Not Redistribute
#

cron "ghe-backup" do
  command "cd /etc/ghe-util/ && ./bin/ghe-backup >> /etc/ghe-util/backup.log 2>&1"
  user "root"
  hour '7'
  minute '45'
  only_if has_ssh?
end