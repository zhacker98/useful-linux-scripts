#! /bin/bash

# A Script to generate the directory structure for new playbooks
#
#	Written by Joel E White

working_dir="/etc/ansible/roles/"
new_playbook=$1

cd ${working_dir}

mkdir -p ${working_dir}/${new_playbook}

# create playbook directories
for i in tasks handlers templates files vars defaults meta library lookup_plugins
  do mkdir -p ${working_dir}/${new_playbook}/${i}
done

# create playbook main.yml files
for i in tasks handlers vars meta
  do touch ${working_dir}/${new_playbook}/${i}/main.yml
done
