#ARG BASE
#ARG TAG
#FROM ${BASE}:${TAG}
FROM ik1614/inns-2019-base:v1


RUN mkdir -p /workspace
WORKDIR /workspace
COPY bootstrap_venv.sh test-notebook.ipynb ./

#RUN ["source bootstrap_venv.sh"]

CMD ["/bin/bash", "-c", \
     "source activate inns-2019 && jupyter-lab --ip='*' --port=8888 --no-browser --allow-root"]