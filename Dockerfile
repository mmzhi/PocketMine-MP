FROM ubuntu:16.04

WORKDIR /minecraft

ADD install.sh /minecraft
ADD server.properties /data/server.properties
ADD pocketmine.yml /data/pocketmine.yml

RUN touch /data/banned-ips.txt && \
	touch /data/banned-players.txt && \
	touch /data/ops.txt && \
	mkdir -p /data/players && \
	touch /data/white-list.txt && \
	mkdir -p /data/worlds && \
	mkdir -p /data/plugins && \
	mkdir -p /data/resource_packs && \
	touch /data/server.log && \
    ln -s /data/banned-ips.txt /minecraft/banned-ips.txt && \
	ln -s /data/banned-players.txt /minecraft/banned-players.txt && \
	ln -s /data/ops.txt /minecraft/ops.txt && \
	ln -s /data/players /minecraft/players && \
	ln -s /data/pocketmine.yml /minecraft/pocketmine.yml && \
	ln -s /data/server.properties /minecraft/server.properties && \
	ln -s /data/white-list.txt /minecraft/white-list.txt && \
	ln -s /data/worlds /minecraft/worlds && \
	ln -s /data/plugins /minecraft/plugins && \
	ln -s /data/resource_packs /minecraft/resource_packs && \
	ln -s /data/server.log /minecraft/server.log && \
    apt-get update && \
	apt-get -y install wget curl make autoconf automake m4 bzip2 bison g++ libtool-bin && \
    ./install.sh

# Expose the right port
EXPOSE 19132/udp

# Set up the volume for the data
VOLUME /data

# Run the app when launched
CMD [ "bash", "/minecraft/start.sh", "--no-wizard"]