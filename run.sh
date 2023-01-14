#!/bin/bash

params=""

if [ -n "$SV_HOSTNAME" ]; then
    params+=" +sv_hostname \"${SV_HOSTNAME}\""
fi

if [ -n "$SV_AUTOUPDATE" ]; then
    params+=" +sv_autoupdate $SV_AUTOUPDATE"
fi

if [ -n "$G_MAPROTATION" ]; then
    params+=" +g_maprotation $G_MAPROTATION"
fi

if [ -n "$RCON_PASSWORD" ]; then
    params+=" +rcon_password $RCON_PASSWORD"
fi

exec ./wsw_server $params
