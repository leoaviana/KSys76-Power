#!/bin/bash

# Listens for com.system76.PowerDaemon DBus signals using dbus-monitor.
# Whenever a PowerProfileSwitch or a HotPlugDetect signal is detected, it kills the dbus-monitor instance
# and returns a code, which will be interpreted by the widget to do a specific action.

EXITCODE=0

if [ -e "/tmp/hp-hotplugsh-$1.pid" ]; then 
    TERMPID=$(ps -p $(cat /tmp/hp-hotplugsh-$1.pid) -o comm=)
    if [[ $TERMPID == "dbus-monitor" ]]; then
        pkill -F /tmp/hp-hotplugsh-$1.pid
    fi
    > /tmp/hp-hotplugsh-$1.pid 
fi 

while read -r line; do
    if [[ $line == *"com.system76.PowerDaemon"* ]] && [[ $line == *"$1"* ]]; then
        if [[ $1 == "PowerProfileSwitch" ]]; then
            ((EXITCODE=248))
        else # HotPlugDetect
            ((EXITCODE=250))
        fi
        pkill -F /tmp/hp-hotplugsh-$1.pid
    fi
done  < <(dbus-monitor --system --profile "sender='com.system76.PowerDaemon',interface='com.system76.PowerDaemon',type=signal" & echo $! >>/tmp/hp-hotplugsh-$1.pid) 

rm /tmp/hp-hotplugsh-$1.pid
echo "$EXITCODE"
exit $EXITCODE