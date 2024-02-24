FROM registry.access.redhat.com/ubi8/ubi-init
ARG cp_version=7.6
ARG jdk_version=11
RUN curl https://packages.confluent.io/rpm/$cp_version/confluent.repo -o /etc/yum.repos.d/confluent.repo
RUN yum clean all
RUN yum -y install java-$jdk_version-openjdk confluent* --exclude confluent-kafka --exclude confluent-community* --exclude confluent-libserdes*
