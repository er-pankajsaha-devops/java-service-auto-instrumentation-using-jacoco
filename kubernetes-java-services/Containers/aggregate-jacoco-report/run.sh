#!/bin/bash
declare -A PROJECT_LIST=( [java-service]=java-service )
while true; 
    do 
        for sname in "${!PROJECT_LIST[@]}";
            do
                rm -rf /home/jacoco-instrumentation/$HOSTNAME/jacoco-exec/$sname/jacoco.exec ||:
                echo "Merging jacoco.exec files for ${sname}"
                java -jar /home/jacoco-instrumentation/jacoco_jars/org.jacoco.cli-0.8.11.jar merge $(find  "/home/jacoco-instrumentation/" -type f -path '/home/jacoco-instrumentation/'${PROJECT_LIST[$sname]}'-*' -name '*.exec') --destfile "/home/jacoco-instrumentation/$HOSTNAME/jacoco-exec/$sname/jacoco.exec" --quiet
                sleep 2
                echo "All jacoco.exec merge successfully for ${sname}"
                sleep 2
                echo "Report Aggregation in progress for ${sname}"
                rm -rf /home/jacoco-instrumentation/$sname ||:
                sleep 2
                PROJECT_NAME=$(echo $(echo abc_${sname} | sed -e 's/_/ /g')); 
                PROJECT_NAME=$(echo ${PROJECT_NAME} | sed -r 's/\<./\U&/g')
                java -jar /home/jacoco-instrumentation/jacoco_jars/org.jacoco.cli-0.8.11.jar report /home/jacoco-instrumentation/$HOSTNAME/jacoco-exec/$sname/jacoco.exec --classfiles /app/lib/Jacoco_Resources/$sname/classfiles --html "/home/jacoco-instrumentation/$sname" --name "${PROJECT_NAME}" --sourcefiles /app/lib/Jacoco_Resources/$sname/sourcefiles
                echo "Report Successfully Aggregated for ${sname}"
                sleep 2
                echo "Uploading the exec file to same html directory"
                cp -r /home/jacoco-instrumentation/$HOSTNAME/jacoco-exec/$sname/jacoco.exec /home/jacoco-instrumentation/$sname/
                echo "Checking the exec path...for service ${sname}"
                sleep 2
                ls /home/jacoco-instrumentation/$sname/
                sleep 5
            done
        sleep 30m
    done
