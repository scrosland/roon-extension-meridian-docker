# Deprecated

This repo and Docker image is now deprecated. I recommend using the [Roon Extension Manager][] instead which has better support and more frequent updates.

[Roon Extension Manager]: https://github.com/TheAppgineer/roon-extension-manager

<hr>

# roon-extension-meridian-docker
Docker image for https://github.com/RoonLabs/roon-extension-meridian.

## Using pre-built images from Docker hub

There is a pre-built image on [Docker hub][] for Raspberry Pi 3 devices, and possibly other ARM systems. To use this:
```
$ sudo docker pull scrosland/roon-extension-meridian
$ sudo docker run --detach --device=/dev/ttyUSB0 --name=meridian --network=host --restart=unless-stopped scrosland/roon-extension-meridian
```
[Docker hub]: https://hub.docker.com/r/scrosland/roon-extension-powermate

## Build

If you wish to build an image from the Dockerfile, use something like:

```
git clone https://github.com/scrosland/roon-extension-meridian-docker
cd roon-extension-meridian-docker
sudo docker build -t roon-extension-meridian .
```

Expect warnings about deprecated APIs from the compilation of the serialport native code, see [node/serialport #1566][serialport-1566] for more details.

[serialport-1566]: https://github.com/node-serialport/node-serialport/issues/1566

## Run

The serial port device needs to be mapped into the container. First find the device name from `ls /dev/serial` or `ls /dev/ttyUSB*`, then run with:

```
sudo docker run --detach --device=/dev/ttyUSB0 --name=meridian --network=host --restart=unless-stopped roon-extension-meridian
```
