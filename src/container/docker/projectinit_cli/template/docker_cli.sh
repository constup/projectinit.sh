#!/bin/bash

docker_compose_up() {
  docker compose --env-file .env.docker up
}