#!/bin/bash

# change permissions for possible new files
chown $APP_USERNAME.$APP_GROUPNAME -R /var/lib/transmission/downloads
chown $APP_USERNAME.$APP_GROUPNAME -R /var/lib/transmission/watch
chmod 775 -R /var/lib/transmission/downloads
chown $APP_USERNAME.$APP_GROUPNAME -R /var/lib/transmission/watch

transmission-daemon --foreground --config-dir /var/lib/transmission/config