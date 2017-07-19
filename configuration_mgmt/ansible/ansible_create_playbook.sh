#! /bin/bash

# A Script to create Ansible Playbook Structure
#       Per Ansible Best Practices
#
#       Written by Joel E White
#         2017

# Variable definitions
working_dir="/etc/ansible/roles/"
new_playbook=$1

# Preliminary
if [[ -z ${new_playbook} ]]; then
  echo "No ARG1 provided, this represents the playbook name"
  exit
fi

exists_playbook=$(find ${working_dir} -type d -name "${new_playbook}")
if [[ -z "${exists_playbook}" ]]; then
  echo "Proceeding"
else
  echo "A playbook with the name ${new_playbook} already exists in the target directory"
fi

# Main
cd ${working_dir}

mkdir -p ${working_dir}/${new_playbook}

# create playbook directories
for i in tasks handlers templates files vars defaults meta library lookup_plugins; do mkdir -p ${working_dir}/${new_playbook}/${i}; done

# create playbook main.yml files
for i in tasks handlers vars meta; do touch ${working_dir}/${new_playbook}/${i}/main.yml; done
