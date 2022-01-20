kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl > /dev/null
[ -f /etc/bash_completion.d/kubectl ] && source /etc/bash_completion.d/kubectl
[ -f /etc/kubectl_aliases ] && source /etc/kubectl_aliases
