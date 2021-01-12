FROM ubuntu:16.04

ENV PORT=8000
EXPOSE $PORT

RUN apt update
RUN apt install -y python3-dev python3-pip python3-virtualenv sqlitebrowser

COPY . /django-helloworld

RUN cd django-helloworld && pip3 install -r requirements.txt
RUN cd django-helloworld && python3 manage.py migrate

CMD ["python3", "django-helloworld/manage.py", "runserver"]
