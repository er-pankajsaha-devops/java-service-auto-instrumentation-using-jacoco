#!/bin/bash
cd /jacoco_jars/
mv org.jacoco.cli-0.8.11-nodeps.jar org.jacoco.cli-0.8.11.jar
cp -r /jacoco_jars/ /home/jacoco-instrumentation/jacoco_jars/
sleep 2m
while true; 
    do 
        echo ".......................Regenerating jacoco.exec .........................."
        java -jar /home/jacoco-instrumentation/jacoco_jars/org.jacoco.cli-0.8.11.jar dump --address localhost  --destfile /home/jacoco-instrumentation/$HOSTNAME/jacoco.exec --port 6300 --quiet --reset --retry 10
        sleep 10
        echo "jacoco.exec generated successfully............................"
        sleep 10m
    done
