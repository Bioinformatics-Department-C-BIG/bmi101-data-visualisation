FROM rocker/binder:latest

USER root

# Ensure required system libraries and package lists are available
RUN apt-get update && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libfontconfig1-dev

USER ${NB_USER}

# Copy entire repository to user home directory so tutorials and data are available in RStudio
COPY --chown=${NB_USER}:${NB_USER} . ${HOME}

WORKDIR ${HOME}

# Run R package installer
RUN if [ -f install.R ]; then R --quiet -f install.R; fi
