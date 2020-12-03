FROM python:alpine

RUN sed -i 's/http:\/\/dl-cdn.alpinelinux.org/https:\/\/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk update
RUN apk add alpine-sdk nodejs

WORKDIR /code
COPY . /code

RUN pip install -i https://pypi.doubanio.com/simple -r requirements.txt

EXPOSE 8000

CMD ["gunicorn", "-b", "0.0.0.0:8000", "douyu_flask:app"]