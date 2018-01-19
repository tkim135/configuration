# suclass

## `~/.ssh/config`
```
# Route all other connections through the jump box
Host jump1.suclass.vpc
    HostName CHANGE_THIS_TO_YOUR_JUMPBOX_HOSTNAME
    StrictHostKeyChecking no
# Reference boxes like <clusterX.suclass.vpc>
Host *.suclass.vpc !jump*.suclass.vpc
    ProxyCommand ssh -W %h:%p jump1.suclass.vpc
    StrictHostKeyChecking no
```
