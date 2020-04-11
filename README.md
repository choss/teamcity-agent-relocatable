# teamcity-agent-relocatable

Docker image for teamcity agent where the directory inside the container can be changed

# Description

This image is based on https://hub.docker.com/r/jetbrains/teamcity-agent and just adds one tiny script which copies the agent to a different directory and starts it from there. This is done to have multiple agents on the same machine working with the docker wrapper.
It is also recommended to read the official base images documentation and understand it first, before attempting to use this image. 

It is meant for "Option 1" of the official section "Running Builds Which Require Docker"

The script looks for a new environment variable called RELOCATE_DIR and copies the agent installation to this folder. 

VERY IMPORTANT: NO TRAILING SLASH in the environment variable


# Example

Please note the directory is now /opt/somewhere. 

VERY IMPORTANT: NO TRAILING SLASH in the environment variable

```
docker run -it -e SERVER_URL="<url to TeamCity server>"  \
    -e RELOCATE_DIR="/opt/somewhere" \ 
    -v <path to agent config folder>:/data/teamcity_agent/conf \
    -v /var/run/docker.sock:/var/run/docker.sock  \
    -v /opt/somewhere/work:/opt/somewhere/work \
    -v /opt/somewhere/temp:/opt/somewhere/temp \
    -v /opt/somewhere/tools:/opt/somewhere/tools \
    -v /opt/somewhere/plugins:/opt/somewhere/plugins \
    -v /opt/somewhere/system:/opt/somewhere/system \
    choss/teamcity-agent-relocatable 
```
