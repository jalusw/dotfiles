Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"  

  config.vm.hostname = "development"
  config.vm.network "private_network", type: "dhcp"  
  config.vm.network "public_network"

  config.vm.synced_folder ".", "/vagrant"            

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
    vb.cpus = 4
  end

  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y git curl vim build-essential clang cmake libssl-dev libboost-all-dev libreadline-dev libncurses5-dev libgmp3-dev libmpfr-dev libmpc-dev python3 python3-pip python3-venv python3-setuptools python3-wheel python3-requests python3-pandas python3-numpy python3-scipy python3-matplotlib python3-seaborn python3-scikit-learn python3-tkinter
  SHELL
end
