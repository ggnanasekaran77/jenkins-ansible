Ansible Playbook for Jenkins Installation
===

Fully Automated Jenkins
---

**Execute Playbook like play**

`ansible-playbook jenkins.yml`

Details Steps
---

**PreSteps**
* `docker run --name jenkins -p 8081:8080 -d jenkins/jenkins:lts-alpine`
* `docker exec -t jenkins cat /var/jenkins_home/secrets/initialAdminPassword`
* `wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64`
* `ln -s <<Path>>/jq-linux64 /usr/bin/jq`
* `curl -s -k "http://admin:admin@localhost:8081/pluginManager/api/json?depth=1" | jq -r '.plugins[].shortName' | tee plugins.txt
* `docker stop jenkins`
* `docker rm jenkins`

**`Note: PreSteps is to get default plugin list`**


**PrePare Docker File like Below**

FROM jenkins/jenkins:lts-alpine
 
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
 
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy
 
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt


