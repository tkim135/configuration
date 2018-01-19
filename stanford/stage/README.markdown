# stage

## `~/.ssh/config`
```
# Route all other connections through the jump box
Host jump1.stage.vpc
    HostName CHANGE_THIS_TO_YOUR_JUMPBOX_HOSTNAME
    StrictHostKeyChecking no
# Reference boxes like <clusterX.stage.vpc>
Host *.stage.vpc !jump*.stage.vpc
    ProxyCommand ssh -W %h:%p jump1.stage.vpc
    StrictHostKeyChecking no
```
