FROM alpine

COPY rootfs /

RUN apk add \
    --no-cache \
    --update openssh \
    && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
    && sed -i s/#PermitEmptyPasswords.*/PermitEmptyPasswords\ yes/ /etc/ssh/sshd_config \
    && sed -i s/#PubkeyAuthentication.*/PubkeyAuthentication\ yes/ /etc/ssh/sshd_config \
    && echo "root:root" | chpasswd

ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 22

STOPSIGNAL SIGTERM

CMD ["/usr/sbin/sshd", "-D", "-e"]
