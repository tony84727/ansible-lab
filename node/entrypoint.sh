#!/bin/sh

function ensure_host_keys() {
	[[ -e "/etc/ssh/ssh_host_rsa_key" ]] || ssh-keygen -f /etc/ssh/ssh_host_rsa_key -b 4096
	[[ -e "/etc/ssh/ssh_host_ecdsa_key" ]] || ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -t ecdsa
}

function link_authorized_keys() {
	[[ -d "/root/.ssh" ]] || mkdir /root/.ssh && chmod 700 /root/.ssh
	[[ -e "/manage/authorized_keys" ]] && cp /manage/authorized_keys /root/.ssh/authorized_keys
}

# somehow required for ssh login, see https://stackoverflow.com/a/64494450/2640291
function generate_random_root_password() {
	echo "root:$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c32)" | chpasswd
}

ensure_host_keys
link_authorized_keys
generate_random_root_password


exec /usr/sbin/sshd -D