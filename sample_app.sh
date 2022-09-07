#!/bin/bash

mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

cp sample_app.py tempdir
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

echo "FROM python" > tempdir/Dockerfile
echo "RUN pip install flask" >> tempdir/Dockerfile

echo "COPY ./static /home/web/static/" >> tempdir/Dockerfile
echo "COPY ./templates /home/web/templates" >> tempdir/Dockerfile
echo "COPY sample_app.py /home/web" >> tempdir/Dockerfile

echo "EXPOSE 5050" >> tempdir/Dockerfile

echo "CMD python3 /home/web/sample_app.py" >> tempdir/Dockerfile

cd tempdir

sudo docker build -t sampleapp .

sudo docker run -t -d -p 5050:5050 --name samplerunning sampleapp

sudo docker ps -a 
