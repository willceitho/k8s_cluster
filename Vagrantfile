ENV['VAGRANT_NO_PARALLEL'] = 'yes'

VAGRANT_BOX         = "generic/ubuntu2204"
VAGRANT_BOX_VERSION = "4.2.10"
CPUS_MASTER_NODE    = 2
CPUS_WORKER_NODE    = 1
MEMORY_MASTER_NODE  = 2048
MEMORY_WORKER_NODE  = 2048
WORKER_NODES_COUNT  = 2
MASTER_NAME         = "kmaster"
WORKER_NAME         = "kworker"


Vagrant.configure(2) do |config|

  config.vm.provision "shell", path: "scripts/init.sh"
  config.vm.provision "shell", path: "scripts/bootstrap.sh"

  # Kubernetes Master Server
  config.vm.define MASTER_NAME do |node|
  
    node.vm.box               = VAGRANT_BOX
    node.vm.box_check_update  = false
    node.vm.box_version       = VAGRANT_BOX_VERSION
    node.vm.hostname          = "#{MASTER_NAME}.example.com"

    # node.vm.network "private_network", ip: "172.16.16.100"
    node.vm.network "public_network", ip: "192.168.88.160"
    # node.vm.synced_folder "data/#{MASTER_NAME}_data", "/#{MASTER_NAME}_data"
    node.vm.synced_folder "data", "/shared_data"

    node.vm.provider :virtualbox do |v|
      v.name    = "#{MASTER_NAME}"
      v.memory  = MEMORY_MASTER_NODE
      v.cpus    = CPUS_MASTER_NODE
    end
  
    node.vm.provider :libvirt do |v|
      v.memory  = MEMORY_MASTER_NODE
      v.nested  = true
      v.cpus    = CPUS_MASTER_NODE
    end
  
    node.vm.provision "shell", path: "scripts/bootstrap_kmaster.sh"
  
  end


  # Kubernetes Worker Nodes
  (1..WORKER_NODES_COUNT).each do |i|

    config.vm.define "#{WORKER_NAME}#{i}" do |node|

      node.vm.box               = VAGRANT_BOX
      node.vm.box_check_update  = false
      node.vm.box_version       = VAGRANT_BOX_VERSION
      node.vm.hostname          = "#{WORKER_NAME}#{i}.example.com"

      # node.vm.network "private_network", ip: "172.16.16.10#{i}"
      node.vm.network "public_network", ip: "192.168.88.16#{i}"

      # node.vm.synced_folder "data/#{WORKER_NAME}#{i}_data", "/#{WORKER_NAME}#{i}_data"
      node.vm.synced_folder "data", "/shared_data"

      node.vm.provider :virtualbox do |v|
        v.name    = "#{WORKER_NAME}#{i}"
        v.memory  = MEMORY_WORKER_NODE
        v.cpus    = CPUS_WORKER_NODE
      end

      node.vm.provider :libvirt do |v|
        v.memory  = MEMORY_WORKER_NODE
        v.nested  = true
        v.cpus    = CPUS_WORKER_NODE
      end

      node.vm.provision "shell", path: "scripts/bootstrap_#{WORKER_NAME}.sh"

    end

  end

end