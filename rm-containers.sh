#!/usr/bin/bash

docker container rm $(docker container list -a | grep docker-omekas-web | tr -s ' ' | cut -d ' ' -f 1)