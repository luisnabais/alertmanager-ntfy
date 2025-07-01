# alertmanager-ntfy

## Description
Python script running inside a docker container, which parses Alertmanager output to ntfy.sh.
Script can also be executed locally or any other way, as long as dependencies are met.

## Instructions
### Run container
1. Set variable values (ntfy.sh topic and token) in .env file or docker-compose.yml
2. Execute the command: `docker-compose up -d`

### Build container
If you don't want/need to use the pre-built container and/or want/need to build the container by yourself, execute the command:
`docker build -t alertmanager-ntfy:latest .` (my advice is to not use latest, but a version system of your own)