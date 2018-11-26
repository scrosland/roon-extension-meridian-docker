# roon-extension-meridian-docker
Docker image for https://github.com/RoonLabs/roon-extension-meridian.

## WARNING

**This Dockerfile will build an image, but that image is not yet tested. Use at your own risk.**

## Build

If you wish to build an image from the Dockerfile, use something like:

```
git clone https://github.com/scrosland/roon-extension-meridian-docker
cd roon-extension-meridian-docker
sudo docker build -t "${LOGNAME}/roon-extension-meridian" .
```

Expect warnings about deprecated APIs from the compilation of the serialport native code, see [node/serialport #1566][serialport-1566] for more details.

[serialport-1566]: https://github.com/node-serialport/node-serialport/issues/1566

## Run

The serial port device needs to be mapped into the container. First find the device name from `ls /dev/serial` or `ls /dev/ttyUSB*`, then run with:

```
SERIAL=/dev/ttyUSB0
sudo docker run --device="${SERIAL}:${SERIAL}:rwm" "${LOGNAME}/roon-extension-meridian"
```
