# api

Dockerfile and plumber to break captchas

## Usage

To serve the API on `http://localhost:8000` with no load balancing, run the
commands below:

```
sudo docker run decryptr/api:latest
```

To serve the API on `http://localhost:80` with load balancing over 3 instances,
run the commands below:

```
sudo apt install docker-compose
sudo docker pull decryptr/api:balanced
sudo docker-compose up --scale decryptr/api:balanced=3
```
