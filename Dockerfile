FROM python:3-alpine

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN apk --update add python3 py3-pip openssl ca-certificates py-openssl wget bash linux-headers
RUN apk --update add --virtual build-dependencies libffi-dev openssl-dev python3-dev py3-pip build-base \
  && pip install --upgrade pip \
  && pip install --upgrade pipenv\
  && pip install --upgrade tornado\
  && pip install --upgrade requests\
  && pip install --upgrade asyncio\
  && apk del build-dependencies

COPY . /app

ENTRYPOINT [ "python3" ]

CMD [ "main.py" ]
