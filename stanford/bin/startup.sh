#!/bin/bash
# Create helper aliases of the form deploy-${deployment}-${machine}
# To "install", add the following to your ~/.bashrc file:
#   source ${HOME}/opt/configuration/src/stanford/bin/startup.sh
# Protip: This comes pre-installed on deploy boxes.
_dir=${HOME}/opt/configuration/src/stanford
_deploy=${_dir}/bin/deploy
export _deploy
if [ -e "${_dir}" ]; then
    tmp=$(mktemp)
    find "${_dir}" -mindepth 2 -maxdepth 2 -type f -name '*.yml' -executable -exec bash -c $'
        for _playbook_path; do
            _playbook_dir=$(dirname "${_playbook_path}")
            _playbook_dir=$(cd "${_playbook_dir}"; pwd)
            _playbook_name=$(basename "${_playbook_path}")
            _playbook_name=$(echo "${_playbook_name}" | sed \"s/\.yml$//\")
            _deployment=$(basename "${_playbook_dir}")
            printf "alias deploy-%s-%s=\'%s %s \';\n" "${_deployment}" "${_playbook_name}" "${_deploy}" "${_playbook_path}"
        done' _ {} + > ${tmp}
    . "${tmp}"
    rm "${tmp}"
fi
echo
echo
echo "Wecome to $(hostname)!"
echo
if [ ! -d "${HOME}/opt/configuration/etc" ]; then
    echo "Before you can deploy anything other than sandboxes, you'll need to grab a copy of the secrets repository:"
    echo "    git clone git@github.com:USER/REPO \${HOME}/opt/configuration/etc"
    echo
fi
if [ ! -r "${HOME}/.boto" ]; then
    echo "To do pretty much anything useful, you need to copy over your AWS credentials."
    echo "If you already have them saved in ~/.boto, you can copy the file over to this machine."
    echo "If you don't have them or don't know what this means, ask someone :)"
    echo
fi
echo "Protip: secrets are in ~/opt/configuration/etc"
echo "Protip: code is in ~/opt/configuration/src"
if [ -d "${HOME}/opt/configuration/etc" -a -r "${HOME}/.boto" ]; then
    echo "Protip: Since each alias ends by calling 'ansible-playbook', you can "
    echo "  use ansible's command line flags with the aliases too, like: "
    echo '    deploy-stage-workers --list-hosts'
    echo
    echo "What do you want to deploy today?"
    echo "Just type 'deploy-' + <TAB> to autocomplete"
fi
echo
