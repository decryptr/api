key_generator <- function(endpoint) {
  keys <- yaml::read_yaml("keys.yaml")
  new_key <- paste(sample(c(letters, LETTERS, 0:9), 64, replace = TRUE), collapse = "")
  keys[[endpoint]] <- c(keys[[endpoint]] , openssl::sha256(new_key))
  yaml::write_yaml(keys, file = "keys.yaml")
  new_key
}

