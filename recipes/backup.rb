# Author: Justin Schuhmann
# Cookbook Name:: ghe-util
# Recipe:: backup
#
# Copyright 2014, Justin Schuhmann
#
# All rights reserved - Do Not Redistribute
#

cron "ghe-backup" do
  command "cd #{node["ghe-util"]["root_dir"]} && ./bin/ghe-backup >> #{node["ghe-util"]["root_dir"]}/backup.log"
  user "root"
  hour node["ghe-util"]["cron"]["hour"]
  minute node["ghe-util"]["cron"]["minute"]
  day node["ghe-util"]["cron"]["day"]
  month node["ghe-util"]["cron"]["month"]
  weekday node["ghe-util"]["cron"]["weekday"]
  mailto node["ghe-util"]["cron"]["mailto"]
  only_if has_ssh?
end