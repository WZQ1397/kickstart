servers = ["db1","db2","web1","web2","computer"]
Vagrant.configure("2") do |config|
   config.ssh.username = "vagrant"
   config.ssh.password = "vagrant"
   # 设置虚拟机的Box
   node.vm.box = "ubuntu16.04"
   servers.each do |hostname|
      config.vm.define "#{hostname}" do |node|
         # 设置虚拟机的主机名
         node.vm.hostname="#{hostname}.zach"
         # 设置主机与虚拟机的共享目录
         node.vm.synced_folder "/share", "/home/vagrant/share"
         # VirtaulBox相关配置
         node.vm.provider :vmware_fusion do |v|
            if hostname == "db*" 
               v.vmx["memory"] = 16384
               v.vmx["cpus"] = 4
            elsif hostname == "computer*"
               v.vmx["memory"] = 20480
               v.vmx["cpus"] = 8
            else
               v.vmx["memory"] = 8192
               v.vmx["cpus"] = 4
         end
      end
   end
end
