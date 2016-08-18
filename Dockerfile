FROM ubuntu:14.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y python-software-properties software-properties-common
RUN add-apt-repository -y ppa:gluster/glusterfs-3.5 && \
    apt-get update && \
    apt-get install -y glusterfs-client;

ENV GLUSTER_VOL ranchervol
ENV GLUSTER_VOL_PATH /var/www
ENV GLUSTER_HOST storage

WORKDIR ${GLUSTER_VOL_PATH}

mkdir ${GLUSTER_VOL_PATH};
mount -t glusterfs ${GLUSTER_HOST}:/${GLUSTER_VOL} ${GLUSTER_VOL_PATH};

chown -Rf www-data:www-data ${GLUSTER_VOL_PATH};
