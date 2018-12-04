FROM scrosland/roon-extension-base
WORKDIR /app
ENV EXTENSION roon-extension-meridian
RUN apk add --no-cache \
    udev \
  && cd $DATA \
  && git clone https://github.com/RoonLabs/$EXTENSION \
  && cd $EXTENSION \
  && npm install --unsafe-perm --build-from-source
VOLUME /app/extensions

CMD ["/app/update-and-start.sh"]
