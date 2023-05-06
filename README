### Re/create env 
```bash
vagrant destroy -f && vagrant up
```

### Manage snapshots 
```bash
# vagrant snapshot save <SNAPSHOT_NAME>
vagrant snapshot save k8s_init_snapshot
vagrant snapshot list
vagrant snapshot restore k8s_init_snapshot
```

### Re/create env 
```bash
vagrant destroy -f && vagrant up
```

### Make ssh config according to Vagrantfile config
```powershell
# if $HOME\.ssh\config file is present, makes no changes. Carefully copy-paste vmist of the file
if (!(Test-Path -Path $HOME\.ssh\config)) {
    Copy-Item -Path ".\ssh_config" -Destination "$HOME\.ssh\config"
  }
```