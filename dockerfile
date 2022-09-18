FROM python:alpine3.7

COPY . /app
WORKDIR /app

RUN echo "orchsky test"
RUN pip3 install --editable .

CMD skynet check 