# Starting the network part start
  echo "Putting up all this together"
  echo "=========================================================================="
  docker-compose -f ./deployment/all_containers.yaml up -d
  docker-compose -f ./deployment/docker-compose-cli.yaml up -d
  echo "Network started"
  echo "=========================================================================="
  echo "Checking the containers"
  echo "=========================================================================="
  docker ps -a
  echo "All containers running successfully..."
  echo "=========================================================================="
# Starting the network part end
