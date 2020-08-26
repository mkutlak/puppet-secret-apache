# Apache Hello World Website With Auth
Puppet module to provision Apache service with authentication.

When the VM is provisioned you can access the website on `http://localhost:8080`.

The default `username:password` to access the website are `hunter2:******`

## Vagrant UP
``` bash
$ git clone https://github.com/mkutlak/puppet-secret-apache.git
$ cd puppet-secret-apache
$ vagrant up
```

## Vagrant DOWN
To destroy the provisioned VM execute `destroy` command from the `puppet-secret-apache` dir.
``` bash
$ vagrant destroy
```

## Required packages
To provision the VM you will need to have few packages installed on your machine.
- `vagrant`
- `rsync` (You can comment out `synced_folder_type` from Vagrantfile to use default type.)