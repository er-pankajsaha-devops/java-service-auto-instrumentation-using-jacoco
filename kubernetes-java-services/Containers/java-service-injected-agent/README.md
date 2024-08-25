# overview
1. In [Instrument-Publish](.gitlab-ci.yml) stage, it will pull the java-service and inject jacoco agent jar into it. 
2. Adds additional [jacoco entry-point](Dockerfile) to the existing entrypoint of java-service.
3. Image published - ${abc_REGISTRY}/jacoco-service-instrument
