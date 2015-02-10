#!bin/bash -x
grep dockerhost /etc/hosts || echo $(ip route ls | grep ^default | awk '{print $3}') dockerhost >> /etc/hosts

