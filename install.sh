#!/usr/bin/env bash
# -*- coding: utf-8; -*-

frm="/bin/rm -rf"
clonedir="$HOME/mxnanorc"
copy="/bin/cp -prv"
echo_e="/bin/echo -e"
e_red="\033[31m"
e_bold="\033[1m"
e_end="\033[0m"
per_error="$0 ERROR: Permission Denied"
bp_warning="Please backup and delete it before installation."

function installablep() {
    if [ ! -e /usr/bin/git ]; then
        echo "You don't have git. Please install it by your package manager before installation."
        exit 1
    fi

    if [ ! -w $HOME ]; then
        $echo_e "$per_error"
        exit 1
    fi

    if [ -e $HOME/.nanorc ] || [ -e $HOME/.nano ]; then
        echo "Nano configuration (~/.nanorc and/or ~/.nano) already exists."
        echo "$bp_warning"
        exit 1
    elif [ -e $clonedir ]; then
        echo "The clone target directory (~/mxnanorc) already exists."
        echo "$bp_warning"
        exit 1
    else
        return 0
    fi
}

function install_mxnanorc() {
    $echo_e "\n"$e_bold"Start Installation!"$e_end"\n"
    git clone https://github.com/re-mx/mxnanorc.git $clonedir
    $echo_e "\nStart copy...\n"
    $copy $clonedir/.nanorc $HOME/
    $copy $clonedir/.nano $HOME/
    $frm $clonedir
    $echo_e "\n"$e_bold"Installation Completed!"$e_end""
}

$echo_e "\n"$e_bold"Welcome to use my GNU nano confguration"$e_end"\n"
echo "Copyright (C) 2017-2018 MX Reium in BLF club"
echo "License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>"
$echo_e "This is free software; you are free to change and redistribute it.\n"

if installablep; then
    install_mxnanorc
    $echo_e ""$e_bold"Thank you for your using!"$e_end"\n"
fi
