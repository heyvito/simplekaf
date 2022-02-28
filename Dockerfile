FROM openjdk:11

ARG CLUSTER_ID=QqayWFhBQdOanm8v5wiAjQ

RUN apt update && apt install -y kafkacat && rm -rf /var/lib/apt/lists/*

ADD https://dlcdn.apache.org/kafka/3.1.0/kafka_2.13-3.1.0.tgz kafka_2.13-3.1.0.tgz
RUN tar -xzf kafka_2.13-3.1.0.tgz
RUN rm kafka*.tgz
RUN mv kafka_2.13-3.1.0 /kafka
WORKDIR /kafka

COPY kafka.config /etc/kafka.config
RUN bin/kafka-storage.sh format -t $CLUSTER_ID --config /etc/kafka.config

EXPOSE 9092

CMD ["bin/kafka-server-start.sh", "/etc/kafka.config"]
