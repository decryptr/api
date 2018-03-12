# decryptr/api

Dockerfile and plumber to start the api.

## Usage

To serve the API on [http://localhost:80](http://localhost:80)
with no load balancing, run the command below:

```
docker build api .
docker run -p 80:8000 api
```

## Adding a new key

One can add new keys using the `key_generator` function found in `key-generator.R`.
Keys are a sequence of 64 random generated elements and their hash is saved in the `keys.yaml` file. The generated key can only be seen once.

To generate a new key you need to run:

```
source("key-generator.R")
key_generator("name-of-the-endpoint")
```

The function will make necessary modifications to `keys.yaml`. They generated key will be printed to the console.

