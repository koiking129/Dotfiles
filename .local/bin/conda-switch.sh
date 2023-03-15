#!/usr/bin/bash

selection=$({ echo "deactivate"; conda env list; } | grep -Ev "^$|^#" | fzf)
env=$(echo "$selection" | awk '{print $1}')

case "$env" in
    "")
        # pass
    ;;
    "deactivate")
        conda deactivate
    ;;
    *)
        conda deactivate && conda activate "$env"
    ;;
esac

