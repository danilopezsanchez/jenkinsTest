#!/usr/bin/env bash
dockerpath=overrider/capstonetest

docker stop serverUp
docker rm serverUp

docker rmi -f capstonetest
docker rmi -f $dockerpath