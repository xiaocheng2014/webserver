FROM mariadb:11.0.2

COPY autobackup.sh /usr/local/bin/
RUN mkdir -p /backup && \
    chown mysql:mysql /backup && \
    chmod +x /usr/local/bin/autobackup.sh
