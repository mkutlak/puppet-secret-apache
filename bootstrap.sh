command -v puppet > /dev/null \
    && { echo "Puppet is installed! skipping" ; exit 0; }

# Install puppet-release pkg with Puppet repo
dnf install -y https://yum.puppetlabs.com/puppet-release-el-8.noarch.rpm

# Install puppet client
dnf install -y puppet-agent

# Start and enable puppet client
systemctl enable --now puppet.service