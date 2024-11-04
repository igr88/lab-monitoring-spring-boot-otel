FROM eclipse-temurin:21-jre-ubi9-minimal

#WORKDIR /opt/app
ARG JAR_FILE=target/\*.jar
COPY ${JAR_FILE} app.jar
ADD https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/download/v2.9.0/opentelemetry-javaagent.jar /opt/opentelemetry-agent.jar

EXPOSE 8080
ENTRYPOINT java -javaagent:/opt/opentelemetry-agent.jar \
    -Dotel.resource.attributes=service.instance.id=$HOSTNAME \
    -Dotel.traces.exporter=otlp \
    -Dotel.metrics.exporter=otlp \
    -Dotel.exporter.otlp.endpoint=http://otel-collector:4318 \
#    -Dotel.exporter.otlp.logs.endpoint=http://otel-collector:4318/v1/logs \
    -Dotel.exporter.otlp.metrics.endpoint=http://otel-collector:4318 \
#    -Dotel.exporter.otlp.traces.endpoint=http://otel-collector:4318/v1/traces \
    -Dotel.service.name=demo-monitoring \
    -jar /app.jar

#  -Dotel.resource.attributes=service.name=demo-monitoring \