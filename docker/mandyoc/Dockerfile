# =============================================================================
# MANDYOC Docker Image
# =============================================================================
#
# Builds a Docker image for geodynamics modelling software MANDYOC.
# MANDYOC is hosted at https://github.com/ggciag/mandyoc.
#

FROM ggciag/mandyoc-dependencies:latest as mandyoc_stage

LABEL maintainer "Rafael Silva <rafael.m.silva@alumni.usp.br>"

# =============================================================================
# Initialize
# =============================================================================
# ARG USER=aipim
# ARG PETSC_VERSION=3.15.5

# ENV USER ${USER}
# ENV HOME /home/${USER}
# ENV PETSC_VERSION ${PETSC_VERSION}
# ENV PETSC_DIR ${HOME}/petsc-${PETSC_VERSION}
# ENV MPIEXEC ${PETSC_DIR}/bin/mpiexec

ENV MANDYOC_DIR ${HOME}/mandyoc

# =============================================================================
# Build MANDYOC
# =============================================================================
COPY --chown=${USER}:${USER} . ${MANDYOC_DIR}

RUN cd ${MANDYOC_DIR} && \
    make all

USER root
RUN  cp ${MANDYOC_DIR}/mandyoc /usr/local/bin

# =============================================================================
# Final setup
# =============================================================================
FROM mandyoc_stage

ENV MANDYOC /usr/local/bin/mandyoc

USER ${USER}

WORKDIR ${HOME}
