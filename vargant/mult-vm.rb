# -*- mode: ruby -*-
# vi: set ft=ruby :

app_servers = {
    :app1 => '192.168.58.20',
    :app2 => '192.168.58.21'
}

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu"

    config.vm.define :web do |web_config|
        web_config.vm.network :private_network, ip: "192.168.58.10"
        web_config.vm.network :forwarded_port, guest: 80, host: 8080
        config.vm.provider :virtualbox do |vb|
            vb.name = "web"
        end
    end

    app_servers.each do |app_server_name, app_server_ip|
        config.vm.define app_server_name do |app_config|
            app_config.vm.hostname = "#{app_server_name.to_s}.vagrant.internal"
            app_config.vm.network :private_network, ip: app_server_ip
            app_config.vm.synced_folder "../app", "/opt/app"
            app_config.vm.provider "virtualbox" do |vb|
                vb.name = app_server_name.to_s
            end
        end
    end

    config.vm.define :db do |db_config|
        db_config.vm.hostname = "db.vagrant.internal"
        db_config.vm.network :private_network, ip: "192.168.58.30"
        db_config.vm.provider "virtualbox" do |vb|
            vb.name = "db"
            vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
            vb.customize ["modifyvm", :id, "--memory", "512"]
        end
    end
end
