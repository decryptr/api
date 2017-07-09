library(magrittr)

reticulate::py_available(TRUE)
suppressMessages(suppressWarnings({
  rfb_model <- decryptrModels::read_model('rfb')
  trt_model <- decryptrModels::read_model('trt')
  tjmg_model <- decryptrModels::read_model('tjmg')
  esaj_model <- decryptrModels::read_model('esaj')
}))

# arq <- '~/data-raw/decryptr/rfb/captcha2a9710092d73.png'
# img <- arq %>% 
#   readr::read_file_raw() %>% 
#   base64enc::base64encode()

#* @post /predict_rfb
predict_rfb <- function(img) {
  img_decoded <- base64enc::base64decode(img)
  predict(rfb_model, newdata = decryptr::prepare(img_decoded))
}

#* @post /predict_trt
predict_trt <- function(img) {
  img_decoded <- base64enc::base64decode(img)
  predict(trt_model, newdata = decryptr::prepare(img_decoded))
}

#* @post /predict_esaj
predict_esaj <- function(img) {
  img_decoded <- base64enc::base64decode(img)
  predict(esaj_model, newdata = decryptr::prepare(img_decoded))
}

#* @post /predict_tjmg
predict_esaj <- function(img) {
  img_decoded <- base64enc::base64decode(img)
  predict(tjmg_model, newdata = decryptr::prepare(img_decoded))
}
