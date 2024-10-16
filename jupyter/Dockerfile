FROM quay.io/jupyter/pytorch-notebook:latest

COPY requirements.txt /tmp/requirements.txt

RUN while read requirement; do conda install --yes $requirement || pip install $requirement; done < /tmp/requirements.txt