#!/bin/bash
echo fine
make build
service=rsyslog
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
echo "Building $service $TRAVIS_CPU_ARCH image"
docker build ./ -t $DOCKER_USERNAME/${service}:$(git rev-parse --short HEAD)_$TRAVIS_CPU_ARCH
echo "Pushing $TRAVIS_CPU_ARCH image"
docker push $DOCKER_USERNAME/${service}:$(git rev-parse --short HEAD)_$TRAVIS_CPU_ARCH
