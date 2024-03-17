FROM python:3.6.5-slim
COPY . /app
WORKDIR /app

RUN apt-get update
RUN apt install -y python3-pip
RUN pip3 install --upgrade pip
RUN apt-get update
RUN apt-get install -y unixodbc-dev
RUN apt-get update
RUN pip3 install SQLAlchemy
RUN pip3 install pyodbc
RUN pip3 install pyarrow
RUN apt-get update
RUN apt-get install -y apt-transport-https apt-utils
RUN apt-get install -y curl
RUN apt-get update
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB3E94ADBE1229CF
RUN curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list > /etc/apt/sources.list.d/mssql-release.list

RUN apt-get update
ENV ACCEPT_EULA=Y
RUN apt-get install -y msodbcsql17 --allow-unauthenticated

ENV ACCEPT_EULA=Y
RUN apt-get install -y mssql-tools

RUN pip3 install -r requirements.txt


CMD python3 endpoint.py

