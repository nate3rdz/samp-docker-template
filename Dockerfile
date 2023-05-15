#base image for the server container
FROM ubuntu

#sets a x86 arch
RUN dpkg --add-architecture i386

COPY . /samp_server

WORKDIR /samp_server

#puts env setup here
RUN apt-get update
RUN apt-get install -y lib32z1 && apt-get install -y lib32stdc++6

# Change the rcon password
RUN sed -i 's|changeme|temporary_rcon_password_change_me!|' server.cfg

# map server log to STDOUT => use `docker logs samp-server-name` to explore it
RUN ln -sf /dev/stdout server_log.txt

#expose the 7777 port for the server
EXPOSE 7777

ENTRYPOINT [ "./start.sh" ]
