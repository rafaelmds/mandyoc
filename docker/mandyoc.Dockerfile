# =============================================================================
# MANDYOC Docker Image
# =============================================================================
#
# Builds a Docker image for geodynamics modelling software MANDYOC.
# MANDYOC is hosted at https://github.com/ggciag/mandyoc.
#

FROM rafaelmds/mandyoc-dependencies:latest AS mandyoc_stage

LABEL maintainer "Rafael Silva <rafael.m.silva@alumni.usp.br>"

# =============================================================================
# Variables
# =============================================================================
ENV PETSC_VERSION 3.15.0
ENV PETSC_DIR /home/petsc-${PETSC_VERSION}
ENV PETSC_ARCH optimized-${PETSC_VERSION}
ENV MANDYOC_DIR /home/mandyoc

# =============================================================================
# Prepare
# =============================================================================
WORKDIR ${MANDYOC_DIR}

COPY . .

# =============================================================================
# Building MANDYOC
# =============================================================================
RUN make all && \
    cp mandyoc /usr/local/bin

# =============================================================================
# Installing python test requirements
# =============================================================================
RUN if [ -f env/requirements-test.txt ]; \
        then pip3 install -r env/requirements-test.txt; \
    fi
