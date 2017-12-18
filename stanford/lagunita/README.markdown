# lagunita

## `~/.ssh/config`
```
# Route all other connections through the jump box
Host jump1.lagunita.vpc
    HostName CHANGE_THIS_TO_YOUR_JUMPBOX_HOSTNAME
    StrictHostKeyChecking no
# Reference boxes like <clusterX.lagunita.vpc>
Host *.lagunita.vpc !jump*.lagunita.vpc
    ProxyCommand ssh -W %h:%p jump1.lagunita.vpc
    StrictHostKeyChecking no
```
