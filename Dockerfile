FROM rocker/tidyverse
MAINTAINER decryptr <dfalbel@gmail.com>

RUN \
  apt-get update && apt-get install -y apt-transport-https && \
  apt-get install -y libpython-dev python3 python3-pip python3-virtualenv python3-venv libssl-dev libjpeg-dev libmagick++-dev libhdf5-dev && \
  rm -rf /var/lib/apt/lists/*

RUN R -e "install.packages(c('plumber', 'yaml', 'base64enc', 'remotes'))"
RUN R -e "remotes::install_github('rstudio/tensorflow')"
RUN R -e "remotes::install_github('rstudio/keras')"
RUN R -e "keras::install_keras(tensorflow = '1.13.2', extra_packages = 'h5py')"

# Install captcha-breaking captchas
RUN R -e "remotes::install_github('decryptr/decryptr')"

COPY api.R api.R
COPY keys.yaml keys.yaml

# Run
EXPOSE 8080

CMD ["Rscript", "-e", "pr <- plumber::plumb('api.R'); pr$run(host='0.0.0.0', port=8080)"]
