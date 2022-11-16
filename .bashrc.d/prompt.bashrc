# Normal green
ng="\[\e[0;32m\]"
# Normal purple
np="\[\e[0;35m\]"
# Normal blue
nb="\[\e[0;34m\]"
# Normal brown
nbr="\[\e[0;33m\]"
# Normal red
nr="\[\e[0;31m\]"
# Exit color change mode
eccm="\[\e[0m\]"
function prompt_command {
    # Previous command exit code
    exit_code=$?

    # Git branch
    branch=$(git branch --show-current 2> /dev/null)
    if [ -z $branch ]; then
    	git=""
    else
        git="${nbr}on branch $branch$eccm"
    fi

    # Exit status
    if [ $exit_code -ne 0 ] && [ $exit_code -ne 130 ] ; then
        exitstatus="$nr:($eccm"
    else
        exitstatus="$ng:)$eccm"
    fi

    time="$ng\t$eccm"
    user="$np\u@\H$eccm"
    workingdir="$nb\w$eccm"
    entry="$ng\$$eccm"
    export PS1="$time $user $workingdir $exitstatus $git \n$entry "
}

export PROMPT_COMMAND=prompt_command
# export PS1="\[\033[01;32m\][\t \u@\H \w]\$ \[\e[0m\]"
