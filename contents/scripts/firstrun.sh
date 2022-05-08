 
#!/bin/bash

# This script is ran after the first time you use this widget, it will try to fetch the needed executables in your system,
# if none of the needed programs can be found for some reason, a dialog containing all missing executables in a list will be
# shown and will instruct the user to click one to get a command to install it's package in his system.

IFS=: read -ra dirs_in_path <<< "$PATH"

OPTIONSSELECT=""
LASTEXIT=0
TITLE="$1"
MESG="$2"
MESGSYSMISSING="$3"

HASDBUS=false
HASLIBNOTIFY=false
HASPCIUTILS=false
HASSYS76POWER=false

for dir in "${dirs_in_path[@]}"; do
    for file in "$dir"/*; do
        if [[ -x $file && -f $file ]]; then
            pfile=""
            printf -v pfile '%s' "${file##*/}"
            [[ $pfile == "dbus-send" ]] && HASDBUS=true
            [[ $pfile == "notify-send" ]] && HASLIBNOTIFY=true
            [[ $pfile == "lspci" ]] && HASPCIUTILS=true
            [[ $pfile == "system76-power" ]] && HASSYS76POWER=true
        fi
    done
done 

[ $HASDBUS = false ] &&  OPTIONSSELECT="${OPTIONSSELECT} dbus-send dbus-send "
[ $HASLIBNOTIFY = false ] && OPTIONSSELECT="${OPTIONSSELECT} notify-send notify-send "
[ $HASPCIUTILS = false ] && OPTIONSSELECT="${OPTIONSSELECT} lspci lspci "
[ $HASSYS76POWER = false ] && OPTIONSSELECT="${OPTIONSSELECT} sy76soft system76-power "

tryRun() { 
    if [[ $OPTIONSSELECT != "" ]]; then 
        KDIAGRESULT=$(kdialog --title "$TITLE" --menu "$MESG" $OPTIONSSELECT)
        LASTEXIT="$?"
        if [[ $KDIAGRESULT != "" ]]; then
            if [[ $KDIAGRESULT == "sy76soft" ]]; then
                KNDIG=$(kdialog --title "$TITLE" --yesno "$MESGSYSMISSING")
                if [[ $? == 0 ]]; then
                    xdg-open https://support.system76.com/articles/system76-software/
                    xdg-open https://support.system76.com/articles/system76-driver/
                fi
            else
                xdg-open https://command-not-found.com/$KDIAGRESULT
            fi
        fi 
        if [[ $LASTEXIT == 0 ]]; then
            tryRun
        fi
    fi
} 

tryRun

exit 0