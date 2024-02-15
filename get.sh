#!/bin/bash

CODENAME=bullseye
key_dir=/usr/share/keyrings
base_url=https://raw.githubusercontent.com/turnkeylinux/common/master/overlays/bootstrap_apt
repos=(main security testing)
for repo in ${repos[@]}; do
    local_path=$key_dir/tkl-$CODENAME-$repo
    keyring=$local_path.gpg
    keyfile=$local_path.asc
     key_url=${base_url}${keyfile}
    wget -O $keyfile $key_url
    gpg --no-default-keyring --keyring $keyring --import $keyfile
    rm $keyfile
done
