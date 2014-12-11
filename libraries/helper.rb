module GheUtil
  module Helper
    include Chef::Mixin::ShellOut

    def has_ssh?
      cmd = shell_out!('bin/ghe-host-check', :cwd => node["ghe-util"]["root_dir"])
      cmd.error!
    end

    def backup_ghe
      cmd = shell_out!('bin/ghe-backup', :cwd => node["ghe-util"]["root_dir"])
      cmd.error!
    end

    def restore_ghe
      cmd = shell_out!('bin/ghe-restore', :cwd => node["ghe-util"]["root_dir"])
      cmd.error!
    end

    def maintence_mode(mode)
      cmd = shell_out!("curl -X POST 'http://#{node["ghe-util"]["hostname"]}/setup/api/maintenance?license_md5=#{node["ghe-util"]["license_md5"]}' -d 'maintenance={\"enabled\":#{mode}, \"when\":\"now\"}'")
      cmd.error!
    end
  end
end

Chef::Recipe.send(:include, ::GheUtil::Helper)
Chef::Resource.send(:include, ::GheUtil::Helper)
Chef::Provider.send(:include, ::GheUtil::Helper)