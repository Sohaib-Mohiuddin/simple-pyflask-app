FROM alpine:latest
RUN apk --update add --no-cache bash nano vim python3-dev py3-pip
WORKDIR /flask_app
ENV STATIC_URL /static
ENV STATIC_PATH /flask_app/app/static
ENV FLASK_APP main.py
COPY /flask_app /flask_app
COPY ./requirements.txt ./requirements.txt
RUN pip3 install -r ./requirements.txt
EXPOSE 5000
ENTRYPOINT ["python3", "-m"]
CMD ["flask", "run", "-h", "0.0.0.0"]
