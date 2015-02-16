FROM fedora:21

MAINTAINER rgolan <rgolan@redhat.com>

RUN yum -y install git iproute && yum clean all
RUN yum -y install https://kojipkgs.fedoraproject.org//packages/maven/3.2.1/11.fc21/noarch/maven-3.2.1-11.fc21.noarch.rpm

# ovirt-engine is assumed to be installed on the docking host. setting dockerhost record to resolve it.
ADD dockerhost.sh /dockerhost.sh

RUN useradd ovirt

# Clone ovirt-optimizer repo
RUN su - ovirt -c "git clone git://gerrit.ovirt.org/ovirt-optimizer"

# Build 
RUN su - ovirt -c "cd ovirt-optimizer && mvn clean install"

# Add config file
ADD ./ovirt-optimizer.properties /home/ovirt/ovirt-optimizer.properties

ENTRYPOINT bash /dockerhost.sh \
           && su - ovirt -c \
                "export OVIRT_OPTIMIZER_CONFIG=/home/ovirt/ovirt-optimizer.properties \  
		 && cd ovirt-optimizer \ 
                 && mvn -Prun -pl ovirt-optimizer-jetty/"

