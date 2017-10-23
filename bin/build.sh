#!/bin/sh

cd image &&
    docker build --tag endlessplanet/movingtea:$(git rev-parse --verify HEAD) .