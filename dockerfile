FROM python:alpine3.7

COPY . /app
WORKDIR /app

RUN echo "click test"
RUN pip3 install --editable .

CMD skynet check 