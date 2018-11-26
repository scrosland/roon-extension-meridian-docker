FROM node:8-alpine

WORKDIR /app

RUN apk add --no-cache \
    g++ \
    gcc \
    git \
    linux-headers \
    make \
    python \
    udev \
  && npm -g config set user root \
  && npm install node-gyp --global \
  && git clone https://github.com/RoonLabs/roon-extension-meridian \
  && cd roon-extension-meridian \
  && npm install --unsafe-perm --build-from-source

CMD ["node", "roon-extension-meridian/app.js"]
