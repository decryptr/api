library(decryptr)
library(base64enc)

model_rfb <- load_model("rfb")
model_rsc <- load_model("rsc")
model_cadesp <- load_model("cadesp")
model_nfesp <- load_model("nfesp")

keys <- yaml::read_yaml("keys.yaml")

#* @get /
root <- function() {
  "hello world"
}

#* @post /rfb
rfb <- function(img, key){

  key <- openssl::sha256(key)
  if(!key %in% keys$rfb | is.null(key) | is.na(key)) {
    stop("Not authorized. Get an api key from decryptr.com.br")
  }

  img_decoded <- base64enc::base64decode(img)
  message(Sys.time(), ": rfb")
  decrypt(img_decoded, model_rfb)
}

#* @post /rsc
rsc <- function(img, key){

  key <- openssl::sha256(key)
  if(!key %in% keys$rsc | is.null(key) | is.na(key)) {
    stop("Not authorized. Get an api key from decryptr.com.br")
  }

  img_decoded <- base64enc::base64decode(img)
  message(Sys.time(), ": rsc")
  decrypt(img_decoded, model_rsc)
}

#* @post /cadesp
cadesp <- function(img, key){

  key <- openssl::sha256(key)
  if(!key %in% keys$cadesp | is.null(key) | is.na(key)) {
    stop("Not authorized. Get an api key from decryptr.com.br")
  }

  img_decoded <- base64enc::base64decode(img)
  message(Sys.time(), ": cadesp")
  decrypt(img_decoded, model_cadesp)
}

#* @post /nfesp
nfesp <- function(img, key){

  key <- openssl::sha256(key)
  if(!key %in% keys$nfesp | is.null(key) | is.na(key)) {
    stop("Not authorized. Get an api key from decryptr.com.br")
  }

  img_decoded <- base64enc::base64decode(img)
  message(Sys.time(), ": nfesp")
  decrypt(img_decoded, model_nfesp)
}
