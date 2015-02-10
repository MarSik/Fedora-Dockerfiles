FROM fedora

MAINTAINER rgolan <rgolan@redhat.com>

RUN yum -y install git maven iproute && yum clean all

# ovirt-engine is assumed to be installed on the docking host. setting dockerhost record to resolve it.
ADD dockerhost.sh /dockerhost.sh

RUN useradd ovirt

# Clone ovirt-optimizer repo
RUN su - ovirt -c "git clone git://gerrit.ovirt.org/ovirt-optimizer"

# Add relevant fixes. once merged this will be off
RUN su - ovirt -c "cd ovirt-optimizer && git fetch git://gerrit.ovirt.org/ovirt-optimizer refs/changes/39/37639/1 && git checkout FETCH_HEAD"

# Build 
RUN su - ovirt -c "cd ovirt-optimizer && mvn clean install"

# Add config file
ADD ./ovirt-optimizer.properties /home/ovirt/ovirt-optimizer.properties

ENTRYPOINT bash /dockerhost.sh \
           && su - ovirt -c \
                "export OVIRT_OPTIMIZER_CONFIG=/home/ovirt/ovirt-optimizer.properties \  
		 && cd ovirt-optimizer \ 
                 && mvn jetty:run -pl ovirt-optimizer-jetty/"
