FROM python:3.8-slim as python-base
ENV DOCKER=true
ENV GIT_PYTHON_REFRESH=quiet

ENV PIP_NO_CACHE_DIR=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

RUN docker volume create yacht
RUN docker run -d -p 8000:8000 -v /var/run/docker.sock:/var/run/docker.sock -v yacht:/config --name yacht selfhostedpro/yacht

WORKDIR /Netfoll
RUN pip install --no-warn-script-location --no-cache-dir -r requirements.txt

EXPOSE 8080
RUN mkdir /data

CMD python -m hikka
