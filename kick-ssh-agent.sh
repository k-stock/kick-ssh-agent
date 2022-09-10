SSH_AGENT_ENV=${HOME}/.kick-ssh-agent-env
SSH_AGENT_KEY_LIST=${HOME}/.kick-ssh-agent-keylist

function start_ssh_agent() {
    ssh-agent > ${SSH_AGENT_ENV}
    source "${SSH_AGENT_ENV}" > /dev/null 2>&1
}

function add_ssh_key() {
    key_file=$1
    finger_print=$(ssh-keygen -l -f "$key_file")
    ssh-add -l | grep -q "${finger_print}" || ssh-add "${key_file}"
}

if [ -e "${SSH_AGENT_ENV}" ]; then
    source "${SSH_AGENT_ENV}" > /dev/null 2>&1
    ssh-add -l > /dev/null 2>&1
    if [ $? -eq 2 ]; then
        start_ssh_agent
    fi
else
    start_ssh_agent
fi

if [ -e "${SSH_AGENT_KEY_LIST}" ]; then
    while read KEY_FILE
    do
        # For tilde expansion
        key=$(eval "echo ${KEY_FILE}")
        if [ -z "$key" ]; then
            continue
        fi
        add_ssh_key "$key"
    done < ${SSH_AGENT_KEY_LIST}
fi
