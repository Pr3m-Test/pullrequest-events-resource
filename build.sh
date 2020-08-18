#! /bin/bash


cd scripts && yarn && yarn run test:all && cd ../

if [[ ! -z "$TRAVIS_TAG" ]]; 
then
    echo "This is a tagged Build"
    echo "TRAVIS_TAG=${TRAVIS_TAG}"
    echo "Publishing to Docker Hub..."
    docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD" && \
    docker build -t Pr3m-Test/pullrequest-events-resource:${TRAVIS_TAG} -t Pr3m-Test/pullrequest-events-resource:latest . && \
    docker push Pr3m-Test/pullrequest-events-resource:${TRAVIS_TAG} && \
    docker push Pr3m-Test/pullrequest-events-resource:latest
fi
