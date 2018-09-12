FROM conda/miniconda3
ARG VENV_NAME

ENV NB_USER attendee
ENV NB_UID 1000
ENV HOME /home/${NB_USER}
ENV VENV_NAME $VENV_NAME

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}

COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}

USER ${NB_USER}
WORKDIR ${HOME}
RUN binder/bootstrap_venv.sh $VENV_NAME && \
    rm -rf ${HOME}/.cache/*

CMD ["/bin/bash", "-c", \
     "source activate $VENV_NAME && jupyter lab --port=8888 --ip=0.0.0.0 --no-browser"]