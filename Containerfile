# oVirt Ansible utility container
#
# VERSION   0.2

FROM fedora:31

LABEL maintainer.name="James Walton" \
      maintainer.email="jfw@redhat.com" \
      description="Utility container for oVirt Ansible playbooks" \
      version="0.2"

RUN dnf -y update && \
    dnf -y install \
    bind-utils \
    iputils \
    openssh \
    openssh-clients \
    gcc \
    libxml2-devel \
    python3-devel \
    python3-pycurl \
    pip \
    ansible \
    && dnf clean all

RUN pip install ovirt-engine-sdk-python

RUN useradd -u 1000 -U -m -d /ovirt ovirt
RUN mkdir /ovirt/workdir && \
    chown ovirt:ovirt /ovirt/workdir && \
    chmod 775 /ovirt/workdir

WORKDIR /ovirt/workdir
USER ovirt

CMD ["/usr/bin/bash"]
