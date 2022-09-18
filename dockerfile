FROM python:alpine3.7

COPY . /app
WORKDIR /app

RUN echo "click test 123"
RUN echo "extra echo command"
RUN pip3 install --editable .

CMD skynet check 