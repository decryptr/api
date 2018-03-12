library(decryptr)
library(base64enc)

model_rfb <- load_model("rfb")
keys <- yaml::read_yaml("keys.yaml")

#* @post /rfb
rfb <- function(img, key){

  key <- openssl::sha256(key)
  if(!key %in% keys$rfb | is.null(key) | is.na(key)) {
    stop("Not authorized. Get an api key from decryptr.com.br")
  }

  img_decoded <- base64enc::base64decode(img)
  decrypt(img_decoded, model_rfb)
}

