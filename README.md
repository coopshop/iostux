# README

## Ruby version

  - Ruby 2.3.1

## System dependencies

  - Docker. 
    - [OSX](https://docs.docker.com/docker-for-mac/install/) 
    - [Windows 10](https://docs.docker.com/docker-for-windows/install/)

## Configuration

  - First step, run `bin/bundle install`. This will install all needed Ruby dependencies.

## Database creation

  - After installing docker, run the following:
  
    ```
    docker pull mdeboard/iostux-postgres
    docker run --name iostux -p 127.0.0.1:6432:5432 -d mdeboard/iostux-postgres
    ```

  - This will start a docker container running postgres, with the `iostux`
    database already created. You can connect to this server by running:
    
    ```
    psql -h localhost -p 6432 -U postgres iostux
    ```
