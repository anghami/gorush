#!/bin/bash

# Get all stage names, and enrich them with --cache-from.
export CACHE_FROM=$(cat Dockerfile |\
 grep -i from |\
 grep -i " as " |\
 awk '{print $NF}' |\
 xargs -I{} echo "--cache-from $DOCKER_REGISTRY/$DOCKER_REGISTRY_ORG/$APP_NAME:stage_{}" |\
 tr '\n' ' ')

# Save the values for later.
echo ${CACHE_FROM} > CACHE_FROM

# Pull the image of every stage if it exists.
cat Dockerfile |\
 grep -i from |\
 grep -i " as " |\
 awk '{print $NF}' |\
 xargs -I{} bash -c "docker pull $DOCKER_REGISTRY/$DOCKER_REGISTRY_ORG/$APP_NAME:stage_{} || true"

# Build every stage sepparately and get cache manually.
# This is because docker multi-stage build does not cache all stages. This is due to a limitation in docker.
cat Dockerfile |\
 grep -i from |\
 grep -i " as " |\
 awk '{print $NF}' |\
 xargs -n 1 -I{} bash -c "(docker build $CACHE_FROM -f Dockerfile --target {} -t $DOCKER_REGISTRY/$DOCKER_REGISTRY_ORG/$APP_NAME:stage_{} . && docker push $DOCKER_REGISTRY/$DOCKER_REGISTRY_ORG/$APP_NAME:stage_{}) || exit 255" # Fails if any stage fails.