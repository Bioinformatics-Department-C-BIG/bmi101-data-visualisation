FROM rocker/binder:latest

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libfontconfig1-dev \
    && rm -rf /var/lib/apt/lists/*

USER ${NB_USER}

COPY --chown=${NB_USER}:${NB_USER} install.R /home/${NB_USER}/install.R

RUN Rscript /home/${NB_USER}/install.R
