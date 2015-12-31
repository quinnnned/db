FROM java:8-jdk
MAINTAINER Oliver Brooks <real.ollie.bee@gmail.com>
LABEL Description="Titan 1.0 with Embedded Cassandra and Gremlin WebSocketChannelizer" Version="1.0" Tags="cassandra,elasticsearch,graph,gremlin,titan"

# Start cassandra install
RUN echo "deb http://debian.datastax.com/community stable main" > /etc/apt/sources.list.d/cassandra.sources.list
RUN curl -L http://debian.datastax.com/debian/repo_key | apt-key add -
RUN apt-get update && apt-get install -y \
    cassandra=2.1.9 \
    dsc21=2.1.9-1 
VOLUME /var/lib/cassandra

# Start titan install
WORKDIR /opt/titan-1.0.0-hadoop1
RUN curl -o /opt/titan.zip http://s3.thinkaurelius.com/downloads/titan/titan-1.0.0-hadoop1.zip
RUN unzip /opt/titan.zip -d /opt/ && \
    rm    /opt/titan.zip
    
# Add config files
ADD gremlin-server.yaml /opt/titan-1.0.0-hadoop1/conf/gremlin-server/
ADD titan-cassandra-embedded.properties /opt/titan-1.0.0-hadoop1/conf/gremlin-server/

# 8182: gremlin server
# 7000: intra-node communication
# 7001: TLS intra-node communication
# 7199: JMX
# 9042: CQL
# 9160: thrift service
EXPOSE 8182 7000 7001 7199 9042 9160

# Start Gremlin Server
CMD ["/opt/titan-1.0.0-hadoop1/bin/gremlin-server.sh", "/opt/titan-1.0.0-hadoop1/conf/gremlin-server/gremlin-server.yaml"]