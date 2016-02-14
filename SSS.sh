#!/bin/bash
#Inert newline to file end if it doesn't end with one
function aNewLine {
    NEWLINEFLAG=`tail -c 1 $1`
    if [ -n "$NEWLINEFLAG" ];then
        echo "Insert newline to $1."
        printf "\n" >> $1
    fi
}

cp -a /etc/ssh /root/ssh.bak
SSS_SCRIPT_PATH=$(pwd)
cd /etc/ssh
aNewLine sshd_config
aNewLine ssh_config
sed -f $SSS_SCRIPT_PATH/sshd_config.sed -i sshd_config
cat $SSS_SCRIPT_PATH/sshd_config.add >> sshd_config
sed -f $SSS_SCRIPT_PATH/ssh_config.sed -i ssh_config
#Get if there are any valuable Host * first
HOSTSTARFLAG=`grep -io "^\s*Host\s*\*" ssh_config`
if [ -z "$HOSTSTARFLAG" ];then
    printf "Host *\n" >> ssh_config
fi
cat $SSS_SCRIPT_PATH/ssh_config.add >> ssh_config
if ! [ -e moduli ]
then
    ssh-keygen -G /root/moduli -b 4096
    ssh-keygen -T /etc/ssh/moduli -f /root/moduli
    rm -f /root/moduli
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
