FROM docker:17.10.0-dind
COPY root /opt/docker/
RUN ["sh", "/opt/docker/scripts/run.sh"]
VOLUME /home
WORKDIR /home/user
ENTRYPOINT ["sh", "/opt/docker/scripts/entrypoint.sh"]
CMD ["--host", "tcp://0.0.0.0:2376"]