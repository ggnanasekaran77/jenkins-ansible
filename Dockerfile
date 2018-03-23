FROM jenkins/jenkins:lts-alpine
 
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
 
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY seedJob.groovy /usr/share/jenkins/ref/init.groovy.d

RUN set -x \
    && /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt \
    && rm -f /tmp/winstone/jenkins.war 
