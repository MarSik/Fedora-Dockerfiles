FROM fedora
MAINTAINER rgolan <rgolan@redhat.com>
RUN yum -y update && yum clean all
RUN yum -y install git mvn && yum clean all
RUN useradd ovirt
RUN echo "grep dockerhost /etc/hosts || echo $(ip route ls | grep ^default | awk '{print $3}' ) dockerhost >> /etc/hosts" > /etc/profile.d/dockerhost.sh 
ADD ./ovirt-optimizer.properties /home/ovirt/ovirt-optimizer.properties
CMD su - ovirt \
    && git clone git://gerrit.ovirt.org/ovirt-optimizer \
    && mvn clean install \
    && OVIRT_OPTIMIZER_CONFIG=/home/ovirt/ovirt-optimizer.properties mvn jetty:run -pl ovirt-optimizer-jetty/
ENTRYPOINT ["/home/ovirt", "-D"]
