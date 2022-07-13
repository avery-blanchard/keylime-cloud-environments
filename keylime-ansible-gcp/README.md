# Ansible Keylime for Google Cloud
Ansible role to deploy a Fedora 35 instance on the Google Cloud Platform with [Keylime](https://github.com/keylime/keylime) and the [rust agent](https://github.com/keylime/rust-keylime) against a Virtualized TPM.

Contributions are welcome, should anyone wish to have this role provision other Linux distributions.

For details on using Keylime, please consult the
[project documentation](https://keylime-docs.readthedocs.io/en/latest/)

For details on the Rust agent, please consult the [repository](https://github.com/keylime/rust-keylime).

## Configuration
1.  Install dependecies for the Ansible - GCP module 
`$ pip3 install requests google-auth`
2. [Create a GCP service account](https://developers.google.com/identity/protocols/oauth2/service-account#creatinganaccount) for ansible's use.
3. [Create and download keys linked to this service account](https://support.google.com/cloud/answer/6158849?hl=en&ref_topic=6262490#serviceaccounts&zippy=%2Cservice-accounts)
4. Add path to ssh key to ansible config (/etc/ansible/ansible.conf) \
Note: the ssh private key is in the downloaded file. Extract it, place it in its own file, set adequate permissions, and add the path to this newly created file to the ansible config. \
Example:\
[defaults] \
private_key_file = /home/user/my_key

5. Set environment variables \
`$ export GCP_PROJECT="<name of GCP project>"` \
`$ export GCP_CRED_KIND="serviceaccount"`\
`$ export GCP_CRED_FILE="<path to your service account key file>"` \
`$ export GCP_ZONE="<zone for GCP instance>"` \
`$ export GCP_REGION="<region for GCP instance>"` 

## Usage
Run the playbook to create and set up an instance. 

```bash
ansible-playbook playbook.yml
```
## Getting started with Keylime 
The best way to get started is to read the [Keylime
Documentation](https://keylime-docs.readthedocs.io/en/latest/), however if you're keen to get started right away, follow these steps.

To start the Keylime verifier and registrar, you will need to start the following services. 

`# keylime_verifier`

`# keylime_registrar`

To start the Keylime rust agent, navigate to the rust-keylime directory and run the following command.

`# RUST_LOG=keylime_agent=trace cargo run --bin keylime_agent`

You can now set up a use case, a good first scenario to try out would be [IMA
Integrity Monitoring](https://keylime-docs.readthedocs.io/en/latest/user_guide/runtime_ima.html)

For more detailed set up scenarios, see the [Keylime
documentation](https://keylime-docs.readthedocs.io/en/latest/user_guide/runtime_ima.html)
