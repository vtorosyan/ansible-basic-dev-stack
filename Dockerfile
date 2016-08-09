# Version 1.0.0
FROM ubuntu:latest
MAINTAINER vtor

RUN echo 'root:root' | chpasswd

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y aptitude sudo openssh-server python2.7 ansible cron

# Install git
RUN echo y | apt-get install git

# Clone the project
RUN git clone https://github.com/vtorosyan/ansible-basic-dev-stack.git /tmp/ansible-init
WORKDIR /tmp/ansible-init

# Run ansible playbook
RUN ansible-playbook run.yml -c local

# Install SSHD
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/sshd

EXPOSE 22

CMD /usr/sbin/sshd -D