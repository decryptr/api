FROM dfalbel/keras-r-docker
MAINTAINER decryptr <contato@decryptr.com.br>

COPY api.R api.R
COPY keys.yaml keys.yaml

# Run
EXPOSE 80

CMD ["Rscript", "-e", "pr <- plumber::plumb('api.R'); pr$run(host='0.0.0.0', port=80)"]
