# Ansible Keylime for AWS
Ansible role to deploy the [Rust-Keylime](https://github.com/keylime/rust-keylime) agent with the [Keylime](https://github.com/keylime/keylime) registrar and verifier against a Virtualized TPM.

For details on using Keylime, please consult the
[project documentation](https://keylime-docs.readthedocs.io/en/latest/)

For details on the Rust agent, please consult the [repository](https://github.com/keylime/rust-keylime).

## Developement
This role is not ready for use. The ansible AWS module currently does not have the functionality to create an AMI with UEFI and TPM enabled. 
A [issue](https://github.com/ansible-collections/amazon.aws/issues/944) has been opened regarding this.

The playbook can be used to configure snapshots to create an AMI with UEFI and TPM support. Currently, the playbook creates a Fedora instance,
partions the disks, creates the EFI system partition, mounts this system partition to /boot/efi, reinstalls the bootloader, creates keys,
self-signs binaries, and then takes snapshots of both volumes. From here, these snapshots can be used to create an AMI that support UEFI and TPM.

### Next steps
Once the ansible/aws ec2 ami module has the ability to support uefi/tpm, the next steps for this playbook are:
1. Export binary blob to localhost to create AMI as uefi-data
2. Use the snapshots to create an AMI with UEFI + TPM
3. Add a task that creates an instance with this AMI
4. Create a role to install keylime on the new instance

### Potential blockers 
1. Automating the EC2 serial console to boot via the UEFI shell (required for boot)
