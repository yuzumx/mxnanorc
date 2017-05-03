#!/usr/bin/env bash

frm="/bin/rm -rfv"
copy="/bin/cp -prv"
ece="/bin/echo -e"
ec_bb="\033[46;30m"
ec_0="\033[0m"
ec_pr="$0 ERROR: Permission Denied"

$ece "\n"$ec_bb"Welcome to use my GNU nano confguration"$ec_0"\n"
echo "Copyright (C) 2017 YuanYuan in BLMF club"
echo "Lincesed under by GNU GPLv3+: GNU GPL 3 and later <http://www.gnu.org/licenses/gpl.html>"
$ece "This is free software; you are free to change and redistribute it.\n"

if [ ! -e /usr/bin/git ]; then
    echo "You don't have git. Please install it by your package manager before installation."
    exit 1
fi

if [ ! -w $HOME ]; then
    $ece "$ec_pr"
    exit 1
elif [ -e $HOME/nanorc ]; then
    echo "The nanorc is exist, Please remove it before installation."
    exit 1
elif [ -e $HOME/.nanorc ] || [ -e $HOME/.nano ]; then
    echo "The .nanorc and/or .nano is exist, Please remove it before installation."
    exit 1
else
    $ece "\n"$ec_bb"Start Installation!"$ec_0"\n"
    git clone https://github.com/YuanPres/nanorc.git ~/nanorc
    $copy ~/nanorc/.nano ~/
    $copy ~/nanorc/.nanorc ~/
    $frm ~/nanorc
fi

$ece "\n"$ec_bb"Installation Completed!"$ec_0""
$ece ""$ec_bb"Thank you for your using!"$ec_0"\n"
