echo "=== Upgrade package ==="
sudo dnf upgrade -y

echo "=== Install python39 ==="
sudo dnf install -y python39
which python3.9
ls -l /usr/bin/python3.9

echo "=== Setup alternatives ==="
sudo alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1
echo "Return code: $?"

sudo alternatives --display python3

echo "=== Set python3 to 3.9 ==="
sudo alternatives --set python3 /usr/bin/python3.9
echo "Return code: $?"

echo "=== Check python version ==="
python3 -V

echo "=== Install python3-dnf ==="
sudo dnf install -y python3-dnf

echo "=== Install dnf-utils ==="
sudo dnf install -y dnf-utils

echo "=== Install Vagrant ==="
sudo dnf install -y dnf-utils
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo dnf install -y vagrant

echo "=== Install Ansible ==="
sudo dnf install -y ansible

echo "=== Install Git ==="
sudo dnf install -y git

echo "=== Install VirtualBox ==="
sudo dnf install -y https://download.virtualbox.org/virtualbox/7.1.8/VirtualBox-7.1-7.1.8_168469_el8-1.x86_64.rpm

echo "=== Export locale ==="
echo "LC_ALL=en_US.UTF-8" >> /etc/environment 