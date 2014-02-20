#!/bin/bash
#           __                __       __                          __
#          / /_  ____  ____  / /______/ /__________ _____    _____/ /_
#         / __ \/ __ \/ __ \/ __/ ___/ __/ ___/ __ `/ __ \  / ___/ __ \
#        / /_/ / /_/ / /_/ / /_(__  ) /_/ /  / /_/ / /_/ / (__  ) / / /
#       /_.___/\____/\____/\__/____/\__/_/   \__,_/ .___(_)____/_/ /_/
#                                                /_/
#
#                                                   - bootstrap.sh
#
#=============================================================================
#==== Script settings ====                                                 {{{

if [ -z "$VERSION"] ; then
    VERSION="0.1.2"
fi

if [ -z "$DOTFILES"] ; then
    DOTFILES=".bashrc .gitconfig .gitignore .gvimrc .screenrc .snippets .vimrc .vimshrc"
fi

if [ -z "$BACKUPROOT"] ; then
    BACKUPROOT="backup"
fi

# }}}
#=============================================================================
#==== Functions ====                                                       {{{

function cp_files() {
    for file in $@ ; do
        echo "cp -vrf $file ~/"
        cp -vrf ./$file ~/
    done
}

function cp_confirm() {
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]] ; then
        cp_files $@
    fi
}

function cp_backup() {
    BACKUPDIR="$(date '+%Y%m%d%H%M%S')"
    SCRIPTDIR="$(pwd)"
    echo "cd ~"
    cd ~
    if [ ! -e $BACKUPROOT ] ; then
        echo "mkdir $BACKUPROOT"
        mkdir $BACKUPROOT
    fi
    echo "mkdir ${BACKUPROOT}/${BACKUPDIR}"
    mkdir ${BACKUPROOT}/${BACKUPDIR}
    for file in $@ ; do
        if [ -e $file ] ; then
            echo "mv ~/$file ~/${BACKUPROOT}/${BACKUPDIR}/"
            mv -vf ~/$file ~/${BACKUPROOT}/${BACKUPDIR}/
        fi
    done
    echo "cd $SCRIPTDIR"
    cd "$SCRIPTDIR"
    cp_files $@
}

function print_ver() {
    echo "bootstrap.sh version $VERSION"
}

function print_usage() {
    echo "Usage: bootstrap.sh [OPTION]"
    echo "Available options are:"
    echo "  -b, --backup     Make a backup of each existing destination files"
    echo "  -f, --force      Do not prompt before overwriting"
    echo "  -h, --help       Display this message and exit"
    echo "      --version    Display version information and exit"
}

function print_help() {
    print_ver
    echo "Copy dotfiles to your home directory"
    echo "<http://github.com/hrnrhty/dotfiles>"
    echo
    print_usage
}

# }}}
#=============================================================================
#==== Main ====                                                            {{{

# Move to the directory which contains this script
cd "$(dirname "${BASH_SOURCE}")"

# Without option
if [ "$1" = "" ] ; then
    cp_confirm $DOTFILES
    exit
fi

# With option
case "$1" in
    -f)
        cp_files  $DOTFILES ; exit ;;
    --force)
        cp_files  $DOTFILES ; exit ;;
    -b)
        cp_backup $DOTFILES ; exit ;;
    --backup)
        cp_backup $DOTFILES ; exit ;;
    --version)
        print_ver           ; exit ;;
    -h)
        print_help          ; exit ;;
    --help)
        print_help          ; exit ;;
    *)
        echo "Unknown option: '$1'"
        print_usage         ; exit ;;
esac

unset cp_files
unset cp_confirm
unset cp_backup
unset print_ver
unset print_usage
unset print_help

# }}}
#=============================================================================
