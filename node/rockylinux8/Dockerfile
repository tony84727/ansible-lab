FROM rockylinux:8

RUN dnf install -yy openssh-server python3 && dnf clean all && systemctl enable sshd.service
ADD --chmod=0755 entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]

