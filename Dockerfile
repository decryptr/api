FROM trestletech/plumber
MAINTAINER decryptr <contato@decryptr.com.br>

# Install Python.
RUN \
  apt-get update && apt-get install -y apt-transport-https && \
  apt-get install -y python python-dev python-pip python-virtualenv && \
  rm -rf /var/lib/apt/lists/*

# Install ML packages
RUN R -e "install.packages('devtools')"
RUN R -e "install.packages('base64enc')"
RUN R -e "install.packages('reticulate')"
RUN R -e "install.packages('tensorflow')"
RUN R -e "tensorflow::install_tensorflow()"
RUN R -e "devtools::install_github('rstudio/keras')"
RUN R -e "keras::install_keras()"

# Install captcha-breaking captchas
RUN R -e "devtools::install_github('decryptr/decryptrModels')"
RUN R -e "devtools::install_github('decryptr/decryptr')"
RUN R -e "devtools::install_github('decryptr/api')"

# Run
CMD ["/usr/local/lib/R/site-library/api/api.R"]
