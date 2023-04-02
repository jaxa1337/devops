FROM python:3.6.8

RUN mkdir /app
WORKDIR /app
COPY ./python/3.6.8/requirements.txt /app/
RUN pip3 install -r requirements.txt

CMD python