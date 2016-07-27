#!/bin/sh
alias deploy-stage-certificates="ansible-playbook certificates.yml -e 'env=stage' "
alias deploy-stage-edxapp="ansible-playbook edxapp.yml -e 'env=stage machine=app1' "
alias deploy-stage-forum="ansible-playbook forum.yml -e 'machine=forum1 env=stage' "
alias deploy-stage-maintenance="ansible-playbook maintenance.yml -e 'machine=maintenance env=stage' "
alias deploy-stage-notifier="ansible-playbook notifier.yml -e 'machine=notifier1 env=stage' "
alias deploy-stage-xqueue="ansible-playbook xqueue.yml -e 'machine=xqueue1 env=stage' "
