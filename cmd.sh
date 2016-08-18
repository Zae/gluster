#!/bin/bash

mount -t glusterfs ${GLUSTER_HOST}:/${GLUSTER_VOL} ${GLUSTER_VOL_PATH};

chown -Rf www-data:www-data ${GLUSTER_VOL_PATH};

nginx -g 'daemon off';
