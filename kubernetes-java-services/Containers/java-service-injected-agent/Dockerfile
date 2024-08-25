#pull official base image
FROM ${abc_registry}/java-service

#creating a directory to store exec file
RUN mkdir -p /home/jacoco-instrumentation/

# Entry Point for Jacoco-Injection
ENTRYPOINT ["java","-javaagent:/home/jacoco-instrumentation/jacoco_jars/org.jacoco.agent-0.8.5-runtime.jar=destfile=/home/jacoco-instrumentation/$HOSTNAME/jacoco.exec,output=tcpserver,address=*,port=6300,append=true","-cp","/app/resources:/app/classes:/app/libs/*","#entryPoint#"]