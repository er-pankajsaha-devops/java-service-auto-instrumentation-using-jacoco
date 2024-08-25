FROM openjdk:21-slim-bullseye
RUN mkdir -p /home/jacoco-instrumentation/
RUN mkdir /jacoco_jars
COPY Jacoco/* /jacoco_jars/
COPY run.sh /jacoco-sidecar/
RUN ["chmod", "+x", "/jacoco-sidecar/run.sh"]
ENTRYPOINT ["/jacoco-sidecar/run.sh"]