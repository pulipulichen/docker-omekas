#!/usr/bin/bash

docker container rm $(docker container list -a | grep docker-omekas-web | tr -s ' ' | cut -d ' ' -f 1)
docker container rm $(docker container list -a | grep nodejs-app-new-note_app | tr -s ' ' | cut -d ' ' -f 1)
docker container rm $(docker container list -a | grep pulipuli-blog_app_run | tr -s ' ' | cut -d ' ' -f 1)
docker container rm $(docker container list -a | grep pwa-plain-text-editor | tr -s ' ' | cut -d ' ' -f 1)
docker container rm $(docker container list -a | grep chrome-shortcut-head-modifier | tr -s ' ' | cut -d ' ' -f 1)
docker container rm $(docker container list -a | grep example_app_ | tr -s ' ' | cut -d ' ' -f 1)
docker container rm $(docker container list -a | grep pwa-idea-organizer_app_run_ | tr -s ' ' | cut -d ' ' -f 1)
docker container rm $(docker container list -a | grep koha_docker | tr -s ' ' | cut -d ' ' -f 1)