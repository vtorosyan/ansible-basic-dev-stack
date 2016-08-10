# Version 1.0.0
FROM ubuntu:latest
MAINTAINER vtor

RUN echo 'root:root' | chpasswd

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y aptitude sudo openssh-server python2.7 ansible

# Install git
RUN echo y | apt-get install git
RUN git clone https://github.com/vtorosyan/ansible-basic-dev-stack.git /tmp/ansible-init

#ADD roles /tmp/ansible-init
#ADD run.yml /tmp/ansible-init

WORKDIR /tmp/ansible-init
RUN ansible-playbook -i "localhost", -c local run.yml

# Install SSHD
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/sshd

EXPOSE 22

CMD /usr/sbin/sshd -D