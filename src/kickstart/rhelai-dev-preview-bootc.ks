# text
## customize this for your target system
clearpart --all --initlabel --disklabel=gpt
reqpart --add-boot
part swap --size=32768
part / --grow --fstype xfs

ostreecontainer --url quay.io/bryonbaker/nvidia-bootc:latest

firewall --disabled
services --enabled=sshd

## optionally add a user
user --name=cloud-user --groups=wheel --plaintext --password
sshkey --username cloud-user "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDZPpYSfSAZBjrtRr/9h24Ldc7a+Iv86q41Bgp0EzhuF3qkxHCf3Ki4lQSYHSbNC4VBMuJ7lVvW/Hn8XgaxGp/Z6pkuMAUxNOoeLyRPPDEGEFwTHQR40W96s8zSpqTjjhSFF1mwkAnGLn1DnckLarkhlCMpNOzCem6OO4vXys3NlWyzpVyuvRl6kG9wyC7fSRG7GSVltuyKMpmqHFsB8aEdFZJG6PV4zOEcbfh6IZvF2/8R7mpJfMEcDSl9dlNy7MrUXz7ZshuL99SN8C1CW3GgDN1pE5Py6QlISSecBtwoV4VDtN4NfhamMq7g/joUzr+DP/SnYMbjs/8bBnRPGVwXjnOVwMEJkz8yuF2sf4Li4X7h+0enlgbz0AiH4p5xiwzznlvaX61hqJ8uPKTt8NDTGpq8MIMPbpVQ24NWyFUGLhXSjM1vm9zvHC9zIRsaJaz4flN13+6w6LdpTgx94EKi36qR4Mgw8BBVJ1ppXZm3MduQtyJG6WiWMw9l39Mfw30= bryon@localhost.localdomain"

## Enable sudo without password for cloud-user
echo "cloud-user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/cloud-user

## Lock the root account
passwd --lock root

