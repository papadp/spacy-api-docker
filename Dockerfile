FROM python:3.6
LABEL maintainer="gontrum@me.com"
LABEL version="0.2"
LABEL description="Base image, containing no language models."

# Install the required packages
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    supervisor \
    curl && \
    apt-get -q clean -y && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/*.bin

RUN pip3 install gunicorn

# Copy and set up the app
COPY . /app

# Build SASSC
RUN bash /app/build_sassc.sh

# Build app
#RUN cd /app && make clean && make
RUN cd /app && pip3 install --upgrade pip &&\
	pip3 install wheel &&\
	pip3 install -r requirements.txt && \
	python3 setup.py install

ENV languages "en_core_web_sm"
RUN cd /app && python3 ./displacy_service/scripts/download.py
RUN cd / && rm -rfd /app

ENV PORT 80

