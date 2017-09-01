# decryptr/api

Dockerfile and plumber to break captchas

## Usage

To serve the API on [http://localhost:80](http://localhost:80)
with no load balancing, run the command below:

```
docker run -p 80:8000 decryptr/api:latest
```

To serve the API with load balancing over 3 instances,
run the commands below (replacing your GitHub personal
access token):

```
git clone https://github.com/decryptr/api.git; cd api
docker-compose up --scale api=3
```
