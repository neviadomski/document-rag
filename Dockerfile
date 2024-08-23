FROM python:3.11-slim AS builder

RUN apt-get update 

RUN pip install pipenv
ENV PIPENV_VENV_IN_PROJECT=1
ADD Pipfile /usr/src/
WORKDIR /usr/src
RUN pipenv install
RUN pipenv requirements > requirements.txt


FROM python:3.11-slim AS runtime

RUN apt-get update
COPY --from=builder /usr/src/requirements.txt /usr/src/requirements.txt
RUN pip install -r /usr/src/requirements.txt

RUN useradd -ms /bin/bash docqa
USER docqa
WORKDIR /home/docqa/app

EXPOSE 8888

CMD ["jupyter", "lab", "--ip='0.0.0.0'"]