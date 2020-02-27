FROM eu.gcr.io/sap-development/infra/java/sap-machine-jvm-base:sapjvm8-sapmachine11-debian

ENV USER=jenkins
ENV GROUP=jenkins
ENV UID=10000
ENV GID=10000
ENV JENKINS_HOME="/home/${USER}"

RUN ls -ltrh /home

RUN groupadd -g ${GID} ${GROUP} && \
    useradd -c "Jenkins user" -d ${JENKINS_HOME} -u ${UID} -g ${GID} -m ${USER} && \
    chown -R ${UID}:${GID} ${JENKINS_HOME}

RUN ls -ltrh /home

RUN chown -R 10000:10000 /home/jenkins

RUN ls -ltrh /home

RUN chown -R jenkins:jenkins /home/jenkins

RUN ls -ltrh /home

RUN mkdir /home/userA && \
    chown -R ${UID}:${GID} /home/userA

RUN ls -ltrh /home

RUN mkdir /home/userB && \
    chown -R ${UID}:${GID} /home/userB

RUN ls -ltrh /home


USER ${USER}
WORKDIR ${JENKINS_HOME}
