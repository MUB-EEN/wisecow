FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    cowsay fortune-mod fortunes netcat-openbsd python3 python3-pip \
    && ln -s /usr/games/cowsay /usr/bin/cowsay \
    && ln -s /usr/games/fortune /usr/bin/fortune \
    && rm -rf /var/lib/apt/lists/*

# Install Flask
RUN pip3 install flask

WORKDIR /app
COPY wisecow.sh /app/wisecow.sh
COPY app.py /app/app.py
RUN chmod +x /app/wisecow.sh

EXPOSE 80
CMD ["python3", "/app/app.py"]

