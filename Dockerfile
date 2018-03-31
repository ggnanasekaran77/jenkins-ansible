FROM jenkinsci/blueocean
 
ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false"
 
COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY seedJob.groovy /usr/share/jenkins/ref/init.groovy.d
ADD ansible.tgz /var/jenkins_home

RUN set -x \
    && /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt \
    && rm -f /tmp/winstone/jenkins.war 
ENV ANSIBLE_HOME ${HOME}/python27
ENV PYTHONUNBUFFERED 1
ENV ANSIBLE_STDOUT_CALLBACK debug
ENV ANSIBLE_FORCE_COLOR true
ENV ANSIBLE_HOST_KEY_CHECKING false
ENV ANSIBLE_TIMEOUT 180
ENV PATH ${ANSIBLE_HOME}/bin:${PATH}
ENV PYTHON_LIBRARY ${ANSIBLE_HOME}/lib:${PYTHON_LIBRARY}
ENV PYTHON_INCLUDE_DIR ${ANSIBLE_HOME}/include:${PYTHON_INCLUDE_DIR}
ENV LD_LIBRARY_PATH ${ANSIBLE_HOME}/lib:${LD_LIBRARY_PATH}
ENV ANSIBLE_REMOTE_USER gnanam
