#!/bin/bash
# manages separate docker-compose files
function docker-stack() {
  operation=$1
  if [ "$operation" = "up" ]; then
     files=$(ls -1 docker-compose-*.yml| sort -n)
     for file in $files
     do
       docker-compose -f $file up -d
     done
  elif [ "$operation" = "down" ]; then
     files=$(ls -1 docker-compose-*.yml| sort -nr)
     for file in $files
     do
       docker-compose -f $file down
     done
  elif [ "$operation" = "prune" ]; then
     docker system prune
  elif [ "$operation" = "pull" ]; then
     files=$(ls -1 docker-compose-*.yml| sort -n)
     for file in $files
     do
       docker-compose -f $file pull
     done
  else
     echo "Unknown command $operation"
  fi
}
