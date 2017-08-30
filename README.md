# api

Dockerfile and plumber to break captchas

## Usage

To serve the API on `http://localhost:80` with load balancing over 3 instances,
simply run the commands below:

```
sudo apt install docker-compose
sudo docker-compose up --scale decryptr/api=3
```
