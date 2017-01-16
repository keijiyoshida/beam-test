FROM ubuntu:16.04

# Environment variables for JDK
ENV JDK_VERSION 8
ENV JDK_UPDATE 112
ENV JDK_OS linux
ENV JDK_ARCH x64

# Environment variables for Apache Maven
ENV MAVEN_MAJOR_VERSION 3
ENV MAVEN_VERSION ${MAVEN_MAJOR_VERSION}.3.9

# Install JDK.
ADD build/jdk-${JDK_VERSION}u${JDK_UPDATE}-${JDK_OS}-${JDK_ARCH}.tar.gz /usr/lib
ENV JAVA_HOME /usr/lib/jdk1.${JDK_VERSION}.0_${JDK_UPDATE}
ENV PATH $PATH:$JAVA_HOME/bin

# Install Apache Maven.ADD
ADD http://ftp.yz.yamagata-u.ac.jp/pub/network/apache/maven/maven-${MAVEN_MAJOR_VERSION}/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz /tmp
RUN tar xzf /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /usr/lib
RUN rm /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz
ENV MAVEN_HOME /usr/lib/apache-maven-${MAVEN_VERSION}
ENV PATH $PATH:$MAVEN_HOME/bin
