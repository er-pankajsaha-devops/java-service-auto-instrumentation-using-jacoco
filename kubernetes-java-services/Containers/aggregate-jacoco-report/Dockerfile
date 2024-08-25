FROM openjdk:21-slim-bullseye
RUN mkdir -p /app/lib
COPY Jacoco_Resources/* /app/lib/Jacoco_Resources/
RUN mkdir -p /home/jacoco-instrumentation/
RUN apt-get update 
RUN apt-get -y install zip unzip ssh curl python3 python3-pip && curl -k "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install
RUN pip install pandas bs4 lxml Jinja2 requests
COPY run.sh /jacoco-report-aggregator/
RUN ["chmod", "+x", "/jacoco-report-aggregator/run.sh"]
ENTRYPOINT ["/jacoco-report-aggregator/run.sh"]
