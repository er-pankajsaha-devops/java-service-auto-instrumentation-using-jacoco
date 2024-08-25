# overview
1. In [jar-Publish](.gitlab-ci.yml) stage, it will download the required jacoco jars from maven repository 
2. After downloading the jars, we need to move it to /jacoco_jars dir of the [image](Dockerfile).
3. Copy the [run.sh](run.sh) to the /jacoco-sidecar and provide appropriate executable permissions.
4. In your Dockerfile, set the entrypoint to run your script at a specified interval.
5. Image published - ${abc_REGISTRY}/jacoco-exec-sidecar
