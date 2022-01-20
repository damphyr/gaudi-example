FROM ruby:2.7.4-buster AS ruby

# Things needed to install the various languages. See later for additional required packages

RUN apt-get update && apt-get -qq -y install \
  autoconf \
  automake \
  bash-completion \
  build-essential \
  curl \
  dos2unix \
  git \
  graphviz \
  iputils-ping \
  jq \
  libffi-dev \
  libgdbm-dev \
  libncurses5-dev \
  libnss3-dev \
  libreadline-dev \
  libssl-dev \
  libtool \
  sudo \
  wget \
  less \
  groff \
  zlib1g-dev\ 
  gnuplot \
  ca-certificates \
  lsb-release \
  bcrypt \
  apache2-utils

WORKDIR /work

# Install docker
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg;\
  echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null;

RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io

# at the bottom as they vary more often than system level packages & languages
# Ruby gems installation
COPY Gemfile .
RUN dos2unix Gemfile
RUN bundle install

COPY profile.d/profile-*.sh /etc/profile.d/
COPY useradd-init /usr/local/bin

RUN dos2unix \
  /etc/profile.d/profile-*.sh \
  /usr/local/bin/useradd-init

WORKDIR /workspace
RUN rm -rf /work/*

ENTRYPOINT ["/bin/bash", "/usr/local/bin/useradd-init"]
