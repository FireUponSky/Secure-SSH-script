#!/bin/bash
cp -a /etc/ssh /root/ssh.bak
SSS_SCRIPT_PATH=$(pwd)
cd /etc/ssh
sed -f $SSS_SCRIPT_PATH/sshd_config.sed -i sshd_config
cat $SSS_SCRIPT_PATH/sshd_config.add >> sshd_config
sed -f $SSS_SCRIPT_PATH/ssh_config.sed -i ssh_config
cat $SSS_SCRIPT_PATH/ssh_config.add >> ssh_config
if ! [ -e moduli ]
then
    ssh-keygen -G /tmp/moduli -b 4096
    ssh-keygen -T /etc/ssh/moduli -f /tmp/moduli
else
    sed -i "/^\([0-9]\+[[:space:]]\+\)\{4\}1[0-9]\{3\}/d" moduli
fi
if ! [ -e ssh_host_ed25519_key ]
then
    ssh-keygen -t ed25519 -N "" -f ssh_host_ed25519_key
fi
if ! [ -e ssh_host_rsa_key ]
then
    ssh-keygen -t rsa -b 4096 -N "" -f ssh_host_rsa_key
fi
