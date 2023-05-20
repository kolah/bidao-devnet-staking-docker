FROM --platform=amd64 ubuntu

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y tar gzip curl locales expect

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen

# locale must be set for deposit-cli to work
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV NUMBER_OF_VALIDATORS 1
ENV EXECUTION_ADDRESS ""
ENV KEYSTORE_PASSWORD ""

RUN curl -LO https://github.com/Bidao-Smart-Chain/staking-deposit-cli/releases/download/v1.0.0/bidao-staking_deposit-cli-1_0_0-linux-amd64.tar.gz && \
    tar -xvzf bidao-staking_deposit-cli-1_0_0-linux-amd64.tar.gz && \
    rm bidao-staking_deposit-cli-1_0_0-linux-amd64.tar.gz
ADD interact.sh /interact.sh
ADD init.sh /init.sh

CMD ["./init.sh"]
