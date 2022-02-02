# simplekaf

`simplekaf` is a basic Docker image that bundles Kafka without Zookeeper for
development usage. If spins up a Kafka server on port 9092.

## Example Usage

For instance, to start a Kafka and Kafdrop instance, use the following
`docker-compose.yaml`:

```yaml
version: "3"

services:
  simplekaf:
    image: victorgama/simplekaf:v0.1.0
    ports:
      - 9092:9092

  kafdrop:
    image: obsidiandynamics/kafdrop
    links:
      - simplekaf
    environment:
      KAFKA_BROKERCONNECT: simplekaf:9092
      JVM_OPTS: -Xms32M -Xmx64M
      SERVER_SERVLET_CONTEXTPATH: /
    ports:
      - 9000:9000

```

## License

```
            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                    Version 2, December 2004

 Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>

 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. You just DO WHAT THE FUCK YOU WANT TO.

```
