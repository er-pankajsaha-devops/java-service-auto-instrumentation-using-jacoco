Report-Aggregate will be merging the exec's of service specific POD and will dump the MERGED exec's respective of service to the PVC.
# overview
1. In [Report-Aggregation](.gitlab-ci.yml) stage, it will download the required java service source and classfiles 
2. Copy the [run.sh](./run.sh) to [/jacoco-report-aggregator](Dockerfile) of the image.
3. Image published - ${abc_REGISTRY}/jacoco-report-aggregator