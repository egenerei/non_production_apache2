#!/bin/bash
mkdir certs
mkdir scripts
mkdir website
mkdir website_conf
vagrant up
ansible-playbook packages.yml
ansible-playbook webconf.yml