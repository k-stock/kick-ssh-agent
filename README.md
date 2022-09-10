# Introduction
A script for starting to use ssh-agent when a bourne sh compatible shell tty is opend.

# Setup
```
$ cp kick-ssh-agent.sh ~/.kick-ssh-agent.sh
$ echo 'source ${HOME}/.kick-ssh-agent.sh' >> ${YOUR_SETUP_SCRIPT}
```
When `${YOUR_SETUP_SCRIPT}` is `~/.bashrc`, `~/.zshrc`, etc.

And prepare the file `~/.kick-ssh-agent-keylist` listed the key to be added to ssh-agent.

A sample contents of `~/.kick-ssh-agent-keylist`:
```
~/.ssh/id_rsa_skyblue
~/.ssh/id_rsa_seagreen
```
