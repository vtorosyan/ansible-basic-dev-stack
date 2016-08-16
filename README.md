# ansible-basic-dev-stack

Ansible playbook with Docker image for basic dev stack. 
 
### Installs and configures the following software
* Java8
* LibreOffice 5.2
* Postgres 9.3
* Ruby 2.0
* Tomcat 7

### Pre-requisites
* [Docker] (https://www.docker.com/) is installed
* Git is installed

### How to Use
* Clone the project and go to the root directory
* Run `docker build -t dev:stack .`
* Run `docker images` and pick ID of created image
* Run `docker run -i -t --entrypoint /bin/bash <imageid>`


