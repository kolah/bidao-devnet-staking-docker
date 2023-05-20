FROM ubuntu

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y unzip curl openjdk-11-jre-headless

EXPOSE 9000 9000/udp

ARG TEKU_VERSION=1.0.0
ENV JAVA_OPTS -Xmx5g
ENV TEKU_OPTS -XX:-HeapDumpOnOutOfMemoryError
ENV GRAFFITI ""
ENV EXECUTION_ADDRESS ""

RUN curl -LO https://github.com/Bidao-Smart-Chain/teku/releases/download/v1.0.0/bidao-teku-${TEKU_VERSION}.zip && \
    unzip bidao-teku-${TEKU_VERSION}.zip -d teku && \
    cp -a teku/bidao-teku-${TEKU_VERSION} /usr/local/bin/teku && \
    rm bidao-teku-${TEKU_VERSION}.zip && \
    rm -r teku

ADD start.sh /start.sh
CMD ["/start.sh"]
