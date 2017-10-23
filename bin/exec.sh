#!/bin/sh

DIND=$(mktemp) &&
    NETW=$(mktemp) &&
    cleanup(){
        docker container stop $(cat ${DIND}) &&
            docker container rm --volumes $(cat ${DIND}) &&
            docker network rm $(cat ${NETW}) &&
            rm -f ${DIND} ${NETW}
    }
    docker network create > ${NETW} &&
    docker container run --cidfile ${DIND} --detach --privileged endlessplanet/movingtea:$(git rev-parse --verify HEAD) &&
    docker network connect --alias docker $(cat ${NETW}) $(cat ${DIND}) &&
    docker container run --interactive --tty --rm --env DOCKER_HOST=tcp://docker:2376 --network ${NETW} docker:17.10.0 sh