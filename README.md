# ovirt-ansible
Container image for working with oVirt Ansible playbooks

[![Docker Repository on Quay](https://quay.io/repository/techjw/ovirt-ansible/status "Docker Repository on Quay")](https://quay.io/repository/techjw/ovirt-ansible)

### Build ovirt-ansible
`podman build -t ovirt-ansible:latest .`

### Pull ovirt-ansible
`podman image pull quay.io/`

### Usage
`podman run -it ovirt-ansible:latest`

To save storage space, automatically delete the container on exit by adding: `--rm`.

`podman run -it --rm ovirt-ansible:latest`

To mount a local directory with your Ansible playbooks into the container, you can add: `-v /hostpath:/ovirt/workdir:ro,Z`

* `/hostpath`: your Ansible playbook directory
* Option `ro`: mount the directory read-only
* Option `Z` : SELinux, apply a private unshared label so the container context can see the mounted host files

`podman run -it --rm -v /hostpath:/ovirt/workdir:ro,Z ovirt-ansible:latest`
