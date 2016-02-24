# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"

# Private IP addresses to assign to each virtual machine.
IP_ADDRESSES = {
  :kibana => "192.168.102.12"
}

def chef_common(chef)
  # workaround for https://tickets.opscode.com/browse/CHEF-4753
  chef.data_bags_path = "."
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"

  # Set the version of chef to install using the vagrant-omnibus plugin.
  # Specifying a specific version to install is safer than using :latest.
  # https://github.com/schisamo/vagrant-omnibus/issues/96
  config.omnibus.chef_version = "11.18.0"

  # Enable the Berkshelf plugin.
  config.berkshelf.enabled = true
  config.berkshelf.berksfile_path = "Berksfile"


  # Define VMs for each layer in the Athena application stack

  # Elasticsearch monitoring cluster
  config.vm.define "kibana" do |kibana|
    kibana.vm.network "private_network", ip: IP_ADDRESSES[:kibana]
    kibana.vm.hostname = "kibana"

    kibana.vm.provision :chef_solo do |chef|
      chef.run_list = ["recipe[athena::kibana]"]
      chef.json = {
        'mycookbook' => {
          'elasticsearch' => {
            'multicast_enabled' => false,
            'publish_host' => IP_ADDRESSES[:kibana]
          }
        }
      }
      chef_common(chef)
    end
  end
end
