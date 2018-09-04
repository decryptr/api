# decryptr/api

Dockerfile and plumber to start the api.

## Usage

To serve the API on [http://localhost:80](http://localhost:80)
with no load balancing, run the command below:

```
docker build -t api .
docker run -p 80:8080 api
```

## Adding a new key

One can add new keys using the `key_generator` function found in `key-generator.R`.
Keys are a sequence of 64 random generated elements and their hash is saved in the `keys.yaml` file. The generated key can only be seen once.

To generate a new key you need to run:

```
source("key-generator.R")
key_generator("name-of-the-endpoint")
```

The function will make necessary modifications to `keys.yaml`. They generated key will be printed to the console. **Note** The key is printed only once.

## Updating the endpoint

On shell, type:

```
docker build -t dfalbel/api .
docker push dfalbel/api
hyper stop decryptr
hyper rm decryptr
hyper pull dfalbel/api
hyper run -d --name decryptr -p 80:8080 --size=s4 dfalbel/api
hyper fip attach decryptr decryptr
```

You must have `hyper` CLI installed.

## Using from R

You can use the API from with the following chunk of code:

```
library(magrittr)

# parameters
arq <- "https://decryptr.netlify.com/img/sample-captcha.png"
key <- "your-api-key"

# converting the image to base64

img <- arq %>%
  readr::read_file_raw() %>%
  base64enc::base64encode()

# post request
res <- httr::POST(
  "https://decryptr.now.sh/rfb",
  body = list(
    img = img,
    key = key
  ),
  encode = "json"
)

httr::content(res)
```

Please visit [decryptr.netlify.com](http://decryptr.netlify.com) fore more info and to obtain your own key.
