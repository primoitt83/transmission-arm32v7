#!/bin/bash

# change permissions for possible new files
chown $APP_USERNAME.$APP_GROUPNAME -R /var/lib/transmission
chmod 775 -R /var/lib/transmission

transmission-daemon --foreground --config-dir /var/lib/transmission/config