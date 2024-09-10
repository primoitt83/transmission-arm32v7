#!/bin/bash

# Exit on error
#set -e

# Load functions
#source /scripts/update-app-user-uid-gid.sh

# Debug output
set -x

# update_user_gid $APP_USERNAME $APP_GROUPNAME $APP_GID
# update_user_uid $APP_USERNAME $APP_UID

# if [ -n "$NET_GW" ]; then
#   ip route del default || true
#   ip route add default via $NET_GW
# fi

# if [ ! -d /var/lib/transmission ]; then
#   mkdir -p /var/lib/transmission 
#   mkdir -p /var/lib/transmission/config 
#   mkdir -p /var/lib/transmission/downloads 
#   mkdir -p /var/lib/transmission/watch
# fi

if [ ! -f /config/settings.json ]; then
  cp /var/lib/transmission/settings.json.default /var/lib/transmission/config/settings.json
else
  cp /config/settings.json /var/lib/transmission/config/settings.json
fi

chown $APP_USERNAME.$APP_GROUPNAME -R /var/lib/transmission
chmod 775 -R /var/lib/transmission

transmission-daemon --foreground --config-dir /var/lib/transmission/config
#exec "$@"