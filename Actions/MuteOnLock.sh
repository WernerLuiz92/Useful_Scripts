#!/bin/bash

gdbus monitor -y -d org.freedesktop.login1 | grep LockedHint --line-buffered |
    while read line
    do
        case "$line" in
            *"<true>"*)
                amixer -q -D pulse sset Master off
            ;;
            *"<false>"*)
                amixer -q -D pulse sset Master on
            ;;
        esac
    done
