# Function to generate PS1 after CMDs
PROMPT_COMMAND=__prompt_command

__prompt_command() {
    # https://stackoverflow.com/a/16715681

    # This needs to be first
    local ec="$?"

    # Reset color
    local RCol='\[\e[0m\]'

    # Color
    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local BYel='\[\e[1;33m\]'
    local BBlu='\[\e[1;34m\]'
    local Pur='\[\e[0;35m\]'
    local White='\[\e[1;37m\]'

    if [ ${ec} != 0 ]; then
        ec="${Red}${ec} "
    else
        ec=""
    fi

    PS1="\n${Gre}\u ${RCol}@ ${BBlu}\h ${Pur}\w ${ec}\n${BYel}$ ${RCol}"
}

