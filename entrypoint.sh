#!/bin/sh

function ensure_managed_keys() {
	if [[ ! -e /root/.ssh/id_rsa ]]; then
		ssh-keygen -f /root/.ssh/id_rsa -P ''
		cp /root/.ssh/id_rsa.pub /manage/authorized_keys
	fi
}

ensure_managed_keys

exec $@
