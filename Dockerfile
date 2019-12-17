FROM teamsprint/metatron:3.3.1

MAINTAINER Jungil Park, Jooho Kim

USER root

RUN yum -y install zip

ENV OOZIE_HOME /opt/oozie
ENV ACTIVEMQ_HOME /opt/activemq

# install activemq
RUN wget https://sktmetatronkrsouthshared.blob.core.windows.net/metatron-public/temp/apache-activemq-5.15.10-bin.tar.gz
RUN tar -zxvf apache-activemq-5.15.10-bin.tar.gz -C /opt
RUN rm -f apache-activemq-5.15.10-bin.tar.gz
RUN ln -s /opt/apache-activemq-5.15.10 /opt/activemq

# install oozie
RUN wget https://sktmetatronkrsouthshared.blob.core.windows.net/metatron-public/temp/oozie-4.3.1-distro.tar.gz
RUN tar -zxvf oozie-4.3.1-distro.tar.gz -C /opt
RUN rm -f oozie-4.3.1-distro.tar.gz
RUN ln -s /opt/oozie-4.3.1 /opt/oozie

ADD conf/oozie-site.xml $OOZIE_HOME/conf/.
RUN mkdir $OOZIE_HOME/libext

RUN wget http://www.java2s.com/Code/JarDownload/mysql/mysql-connector-java-commercial-5.1.7-bin.jar.zip
RUN unzip mysql-connector-java-commercial-5.1.7-bin.jar.zip
RUN mv mysql-connector-java-commercial-5.1.7-bin.jar  $OOZIE_HOME/libext/
RUN rm -f mysql-connector-java-commercial-5.1.7-bin.jar.zip

ADD script/init-oozie-metastore.sh /
ADD script/start-oozie.sh /
ADD script/stop-oozie.sh /

ADD Dockerfile /
ADD README.md /

CMD ["/bin/bash"]

# Integrator port
EXPOSE 11000

