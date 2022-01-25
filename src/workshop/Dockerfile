FROM ruby:2.7.4-buster AS ruby

RUN apt-get update && apt-get -qq -y install \
  dos2unix \
  sudo

WORKDIR /work

COPY profile.d/profile-*.sh /etc/profile.d/
COPY useradd-init /usr/local/bin

RUN dos2unix \
  /etc/profile.d/profile-*.sh \
  /usr/local/bin/useradd-init

WORKDIR /workspace
RUN rm -rf /work/*

ENTRYPOINT ["/bin/bash", "/usr/local/bin/useradd-init"]
