# Mongodb container for Linux 23.04

This container creates a mongodb instance accessible on localhost with a URI of `mongodb://localhost:27018`

## Usage
Use the following sequence of commands to start the docker instance.

```
sudo docker-compose build
sudo docker-compose up
```

### ADB example 
Example based on the pythonDB tools developed by sfeller
(https://github.com/sfeller/pythonDB)

./ADB.py -uri mongodb://localhost:27018 -test
