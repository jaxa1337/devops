#=================================HISTORY FILE==================================
# append to the history file, don't overwrite it
# shopt -s histappend
HISTCONTROL=ignoreboth
# # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
PROMPT_COMMAND='history -a'

#================================INTERACTION===================================
# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Check that we haven't already been sourced.
([[ -z ${CYG_SYS_BASHRC} ]] && CYG_SYS_BASHRC="1") || return

# If started from sshd, make sure profile is sourced
if [[ -n "$SSH_CONNECTION" ]] && [[ "$PATH" != *:/usr/bin* ]]; then
    source /etc/profile
fi

#=============================TERM WINDOW=======================================
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#================================PATHs==========================================
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

#================================CHROOT=========================================
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


#=================================COLORS========================================
# # set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	    color_prompt=yes
    else
	    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\t \[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;36m\]\t \[\033[0;31m\]\u\[\033[00m\]:\w \[\033[0;31m\]\$? \\$\[$(tput sgr0)\]\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# Uncomment to use the terminal colours set in DIR_COLORS
eval "$(dircolors -b /etc/DIR_COLORS)"

#=================================ALIASES======================================
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -lah'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#==============================COMPLETITION=====================================
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#===================================WARNINGS====================================
unset _warning_found
for _warning_prefix in '' ${MINGW_PREFIX}; do
    for _warning_file in ${_warning_prefix}/etc/profile.d/*.warning{.once,}; do
        test -f "${_warning_file}" || continue
        _warning="$(command sed 's/^/\t\t/' "${_warning_file}" 2>/dev/null)"
        if test -n "${_warning}"; then
            if test -z "${_warning_found}"; then
                _warning_found='true'
                echo
            fi
            if test -t 1
                then printf "\t\e[1;33mwarning:\e[0m\n${_warning}\n\n"
                else printf "\twarning:\n${_warning}\n\n"
            fi
        fi
        [[ "${_warning_file}" = *.once ]] && rm -f "${_warning_file}"
    done
done
unset _warning_found
unset _warning_prefix
unset _warning_file
unset _warning


#===================================PS1=========================================
# # If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
#     PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#     ;;
# *)
#     ;;
# esac

# If MSYS2_PS1 is set, use that as default PS1;
# if a PS1 is already set and exported, use that;
# otherwise set a default prompt
# of user@host, MSYSTEM variable, and current_directory
[[ -n "${MSYS2_PS1}" ]] && export PS1="${MSYS2_PS1}"
# if we have the "High Mandatory Level" group, it means we're elevated
#if [[ -n "$(command -v getent)" ]] && id -G | grep -q "$(getent -w group 'S-1-16-12288' | cut -d: -f2)"
#  then _ps1_symbol='\[\e[1m\]#\[\e[0m\]'
#  else _ps1_symbol='\$'
#fi
case "$(declare -p PS1 2>/dev/null)" in
'declare -x '*) ;; # okay
*)
  export PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[35m\]$MSYSTEM\[\e[0m\] \[\e[33m\]\w\[\e[0m\]\n'"${_ps1_symbol}"' '
  ;;
esac
unset _ps1_symbol


# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <https://creativecommons.org/publicdomain/zero/1.0/>. 


# System-wide profile file

# Some resources...
# Customizing Your Shell: http://www.dsl.org/cookbook/cookbook_5.html#SEC69
# Consistent BackSpace and Delete Configuration:
#   http://www.ibb.net/~anne/keyboard.html
# The Linux Documentation Project: https://www.tldp.org/
# The Linux Cookbook: https://www.tldp.org/LDP/linuxcookbook/html/
# Greg's Wiki https://mywiki.wooledge.org/

# Setup some default paths. Note that this order will allow user installed
# software to override 'system' software.
# Modifying these default path settings can be done in different ways.
# To learn more about startup files, refer to your shell's man page.

# MSYS2_PATH="/usr/local/bin:/usr/bin:/bin"
# MANPATH='/usr/local/man:/usr/share/man:/usr/man:/share/man'
# INFOPATH='/usr/local/info:/usr/share/info:/usr/info:/share/info'

# case "${MSYS2_PATH_TYPE:-inherit}" in
#   strict)
#     # Do not inherit any path configuration, and allow for full customization
#     # of external path. This is supposed to be used in special cases such as
#     # debugging without need to change this file, but not daily usage.
#     unset ORIGINAL_PATH
#     ;;
#   inherit)
#     # Inherit previous path. Note that this will make all of the Windows path
#     # available in current shell, with possible interference in project builds.
#     ORIGINAL_PATH="${ORIGINAL_PATH:-${PATH}}"
#     ;;
#   *)
#     # Do not inherit any path configuration but configure a default Windows path
#     # suitable for normal usage with minimal external interference.
#     WIN_ROOT="$(PATH=${MSYS2_PATH} exec cygpath -Wu)"
#     ORIGINAL_PATH="${WIN_ROOT}/System32:${WIN_ROOT}:${WIN_ROOT}/System32/Wbem:${WIN_ROOT}/System32/WindowsPowerShell/v1.0/"
# esac

# unset MINGW_MOUNT_POINT
# . '/etc/msystem'
# case "${MSYSTEM}" in
# MINGW*|CLANG*|UCRT*)
#   MINGW_MOUNT_POINT="${MINGW_PREFIX}"
#   PATH="${MINGW_MOUNT_POINT}/bin:${MSYS2_PATH}${ORIGINAL_PATH:+:${ORIGINAL_PATH}}"
#   PKG_CONFIG_PATH="${MINGW_MOUNT_POINT}/lib/pkgconfig:${MINGW_MOUNT_POINT}/share/pkgconfig"
#   ACLOCAL_PATH="${MINGW_MOUNT_POINT}/share/aclocal:/usr/share/aclocal"
#   MANPATH="${MINGW_MOUNT_POINT}/local/man:${MINGW_MOUNT_POINT}/share/man:${MANPATH}"
#   ;;
# *)
#   PATH="${MSYS2_PATH}:/opt/bin${ORIGINAL_PATH:+:${ORIGINAL_PATH}}"
#   PKG_CONFIG_PATH="/usr/lib/pkgconfig:/usr/share/pkgconfig:/lib/pkgconfig"
# esac

# CONFIG_SITE="/etc/config.site"

# MAYBE_FIRST_START=false
# SYSCONFDIR="${SYSCONFDIR:=/etc}"

# # TMP and TEMP as defined in the Windows environment must be kept
# # for windows apps, even if started from msys2. However, leaving
# # them set to the default Windows temporary directory or unset
# # can have unexpected consequences for msys2 apps, so we define 
# # our own to match GNU/Linux behaviour.
# #
# # Note: this uppercase/lowercase workaround does not seem to work.
# # In fact, it has been removed from Cygwin some years ago. See:
# #
# #     * https://cygwin.com/git/gitweb.cgi?p=cygwin-apps/base-files.git;a=commitdiff;h=3e54b07
# #     * https://cygwin.com/git/gitweb.cgi?p=cygwin-apps/base-files.git;a=commitdiff;h=7f09aef
# #
# ORIGINAL_TMP="${ORIGINAL_TMP:-${TMP}}"
# ORIGINAL_TEMP="${ORIGINAL_TEMP:-${TEMP}}"
# #unset TMP TEMP
# #tmp=$(exec cygpath -w "$ORIGINAL_TMP" 2> /dev/null)
# #temp=$(exec cygpath -w "$ORIGINAL_TEMP" 2> /dev/null)
# #TMP="/tmp"
# #TEMP="/tmp"
# case "$TMP" in *\\*) TMP="$(cygpath -m "$TMP")";; esac
# case "$TEMP" in *\\*) TEMP="$(cygpath -m "$TEMP")";; esac
# test -d "$TMPDIR" || test ! -d "$TMP" || {
#   TMPDIR="$TMP"
#   export TMPDIR
# }


# print_flags ()
# {
#   (( $1 & 0x0002 )) && echo -n "binary" || echo -n "text"
#   (( $1 & 0x0010 )) && echo -n ",exec"
#   (( $1 & 0x0040 )) && echo -n ",cygexec"
#   (( $1 & 0x0100 )) && echo -n ",notexec"
# }

# # Shell dependent settings
# profile_d ()
# {
#   local file=
#   for file in $(export LC_COLLATE=C; echo /etc/profile.d/*.$1); do
#     [ -e "${file}" ] && . "${file}"
#   done
  
#   if [ -n "${MINGW_MOUNT_POINT}" ]; then
#     for file in $(export LC_COLLATE=C; echo ${MINGW_MOUNT_POINT}/etc/profile.d/*.$1); do
#       [ -e "${file}" ] && . "${file}"
#     done
#   fi
# }

# for postinst in $(export LC_COLLATE=C; echo /etc/post-install/*.post); do
#   [ -e "${postinst}" ] && . "${postinst}"
# done

# if [ ! "x${BASH_VERSION}" = "x" ]; then
#   HOSTNAME="$(exec /usr/bin/hostname)"
#   SHELL=`which bash`
#   profile_d sh
#   [ -f "/etc/bash.bashrc" ] && . "/etc/bash.bashrc"
# elif [ ! "x${KSH_VERSION}" = "x" ]; then
#   typeset -l HOSTNAME="$(exec /usr/bin/hostname)"
#   profile_d sh
#   PS1=$(print '\033]0;${PWD}\n\033[32m${USER}@${HOSTNAME} \033[33m${PWD/${HOME}/~}\033[0m\n$ ')
# elif [ ! "x${ZSH_VERSION}" = "x" ]; then
#   HOSTNAME="$(exec /usr/bin/hostname)"
#   profile_d sh
#   profile_d zsh
#   PS1='(%n@%m)[%h] %~ %% '
#   SHELL=`which zsh`
# elif [ ! "x${POSH_VERSION}" = "x" ]; then
#   HOSTNAME="$(exec /usr/bin/hostname)"
#   PS1="$ "
# else 
#   HOSTNAME="$(exec /usr/bin/hostname)"
#   profile_d sh
#   PS1="$ "
# fi

# if [ -n "$ACLOCAL_PATH" ]
# then
#   export ACLOCAL_PATH
# fi

# export PATH MANPATH INFOPATH PKG_CONFIG_PATH USER TMP TEMP HOSTNAME PS1 SHELL tmp temp ORIGINAL_TMP ORIGINAL_TEMP ORIGINAL_PATH CONFIG_SITE
# unset PATH_SEPARATOR

# if [ "$MAYBE_FIRST_START" = "true" ]; then

#   if [ -f "/usr/bin/update-ca-trust" ]
#   then 
#     sh /usr/bin/update-ca-trust
#   fi

#   clear
#   echo
#   echo
#   echo "###################################################################"
#   echo "#                                                                 #"
#   echo "#                                                                 #"
#   echo "#                   C   A   U   T   I   O   N                     #"
#   echo "#                                                                 #"
#   echo "#                  This is first start of MSYS2.                  #"
#   echo "#       You MUST restart shell to apply necessary actions.        #"
#   echo "#                                                                 #"
#   echo "#                                                                 #"
#   echo "###################################################################"
#   echo
#   echo
# fi
# unset MAYBE_FIRST_START
