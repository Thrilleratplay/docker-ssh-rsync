# Creates a tiny SSH and rsync server
# virtual size: 10.74 MB

# From Alpine Linux 3.2 official repo
FROM alpine:3.2

MAINTAINER Tom Hiller

# Set up rsyncd and openSSH, set local time UTC
RUN apk --update add \
  bash \
  rsync \
  openssh && \
  rm -rf /var/cache/apk/* && \
  rc-update add rsyncd boot && \
  sed -i \
    -e 's/^UsePAM yes/#UsePAM yes/g' \
    -e 's/^#UsePAM no/UsePAM no/g' \
    -e 's/^PasswordAuthentication yes/PasswordAuthentication no/g' \
    -e 's/^#UseDNS yes/UseDNS no/g' \
  /etc/ssh/sshd_config && \
  /usr/bin/ssh-keygen -A && \
  ln -sf /usr/share/zoneinfo/UTC /etc/localtime

# Inject authorized keys
ADD authorized_keys /root/.ssh/

# Volume location
VOLUME /data/backup

# Open SSH port
EXPOSE 22

# Run SSHd as a daemonize process to keep container running.
CMD ["/usr/sbin/sshd", "-D"]
