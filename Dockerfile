FROM teamsprint/metatron:3.3.1

MAINTAINER Jungil Park, Jooho Kim

USER root

RUN wget https://ci.bigtop.apache.org/view/Releases/job/Bigtop-1.2.1/OS=centos-7/lastSuccessfulBuild/artifact/output/oozie/noarch/oozie-4.3.0-1.el7.centos.noarch.rpm
RUN wget https://ci.bigtop.apache.org/view/Releases/job/Bigtop-1.2.1/OS=centos-7/lastSuccessfulBuild/artifact/output/bigtop-tomcat/noarch/bigtop-tomcat-6.0.45-1.el7.centos.noarch.rpm
RUN wget https://ci.bigtop.apache.org/view/Releases/job/Bigtop-1.2.1/OS=centos-7/lastSuccessfulBuild/artifact/output/hadoop/x86_64/hadoop-client-2.7.3-1.el7.centos.x86_64.rpm
RUN wget https://ci.bigtop.apache.org/view/Releases/job/Bigtop-1.2.1/OS=centos-7/lastSuccessfulBuild/artifact/output/oozie/noarch/oozie-client-4.3.0-1.el7.centos.noarch.rpm
RUN wget https://ci.bigtop.apache.org/view/Releases/job/Bigtop-1.2.1/OS=centos-7/lastSuccessfulBuild/artifact/output/bigtop-utils/noarch/bigtop-utils-1.2.1-1.el7.centos.noarch.rpm
RUN wget https://ci.bigtop.apache.org/view/Releases/job/Bigtop-1.2.1/OS=centos-7/lastSuccessfulBuild/artifact/output/hadoop/x86_64/hadoop-mapreduce-2.7.3-1.el7.centos.x86_64.rpm
RUN wget https://ci.bigtop.apache.org/view/Releases/job/Bigtop-1.2.1/OS=centos-7/lastSuccessfulBuild/artifact/output/hadoop/x86_64/hadoop-hdfs-2.7.3-1.el7.centos.x86_64.rpm
RUN wget https://ci.bigtop.apache.org/view/Releases/job/Bigtop-1.2.1/OS=centos-7/lastSuccessfulBuild/artifact/output/hadoop/x86_64/hadoop-2.7.3-1.el7.centos.x86_64.rpm
RUN wget https://ci.bigtop.apache.org/view/Releases/job/Bigtop-1.2.1/OS=centos-7/lastSuccessfulBuild/artifact/output/zookeeper/x86_64/zookeeper-3.4.6-1.el7.centos.x86_64.rpm
RUN wget https://ci.bigtop.apache.org/view/Releases/job/Bigtop-1.2.1/OS=centos-7/lastSuccessfulBuild/artifact/output/bigtop-jsvc/x86_64/bigtop-jsvc-1.0.15-1.el7.centos.x86_64.rpm
RUN wget https://ci.bigtop.apache.org/view/Releases/job/Bigtop-1.2.1/OS=centos-7/lastSuccessfulBuild/artifact/output/bigtop-groovy/noarch/bigtop-groovy-2.4.10-1.el7.centos.noarch.rpm
RUN wget https://ci.bigtop.apache.org/view/Releases/job/Bigtop-1.2.1/OS=centos-7/lastSuccessfulBuild/artifact/output/hadoop/x86_64/hadoop-yarn-2.7.3-1.el7.centos.x86_64.rpm

RUN yum -y install bigtop-utils-1.2.1-1.el7.centos.noarch.rpm
RUN yum -y install zookeeper-3.4.6-1.el7.centos.x86_64.rpm
RUN yum -y install hadoop-2.7.3-1.el7.centos.x86_64.rpm
RUN yum -y install bigtop-jsvc-1.0.15-1.el7.centos.x86_64.rpm
RUN yum -y install bigtop-groovy-2.4.10-1.el7.centos.noarch.rpm
RUN yum -y install hadoop-hdfs-2.7.3-1.el7.centos.x86_64.rpm
RUN yum -y install hadoop-yarn-2.7.3-1.el7.centos.x86_64.rpm
RUN yum -y install hadoop-mapreduce-2.7.3-1.el7.centos.x86_64.rpm
RUN yum -y install hadoop-client-2.7.3-1.el7.centos.x86_64.rpm
RUN yum -y install bigtop-tomcat-6.0.45-1.el7.centos.noarch.rpm
RUN yum -y install oozie-client-4.3.0-1.el7.centos.noarch.rpm
RUN yum -y install oozie-4.3.0-1.el7.centos.noarch.rpm

#RUN yum -y localinstall oozie-4.3.0-1.el7.centos.src.rpm
#RUN yum repolist enabled | grep "mysql.*-community.*"

#RUN wget http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm
#RUN yum -y localinstall mysql57-community-release-el7-7.noarch.rpm
#RUN yum repolist enabled | grep "mysql.*-community.*"
#RUN yum -y install mysql-community-server mysql mysql-libs mysql-devel mysql-server
#RUN rm -f mysql57-community-release-el7-7.noarch.rpm

#RUN yum -y install expect

ADD script/start-oozie.sh /
ADD script/stop-oozie.sh /

ADD Dockerfile /
ADD README.md /

CMD ["/bin/bash"]

# Integrator port
EXPOSE 11000

