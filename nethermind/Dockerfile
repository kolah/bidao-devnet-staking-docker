FROM ubuntu

EXPOSE 30303 30303/udp 8551

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y unzip curl libsnappy-dev libc6-dev libc6 && export ARCH=`dpkg --print-architecture` && [ "$ARCH" = "arm64" ] && apt-get install -y libgflags-dev

ARG NETHERMIND_VERSION=1.0.0

RUN export ARCH=`dpkg --print-architecture` && apt-get install libgflags-dev && curl -LO https://github.com/Bidao-Smart-Chain/nethermind/releases/download/v${NETHERMIND_VERSION}/bidao-nethermind-${NETHERMIND_VERSION}-linux-${ARCH}.zip \
    && mkdir /usr/local/bin/nethermind && unzip bidao-nethermind-${NETHERMIND_VERSION}-linux-${ARCH}.zip \
    && mv bidao-nethermind-${NETHERMIND_VERSION}-linux-${ARCH}/* /usr/local/bin/nethermind \
    && rm -r bidao-nethermind-${NETHERMIND_VERSION}-linux-${ARCH} \
    && rm bidao-nethermind-${NETHERMIND_VERSION}-linux-${ARCH}.zip

ADD start.sh /start.sh

ENTRYPOINT ["/start.sh"]
