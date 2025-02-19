# fxsdk-docker
Unofficial dockerfile for fxSDK, development kit for CASIO graphing calculators in the fx-9860G and fx-CG series

Available on Docker Hub: https://hub.docker.com/r/manawyrm/fxsdk

## Build container manually

This takes a long time (30min+ on a fast machine) due to toolchain compilation (binutils, gcc, etc.).  
Use pre-built Docker images on amd64 platforms when possible.

```bash
git clone https://github.com/Manawyrm/fxsdk-docker
docker build -t fxsdk-docker .
```

## Development

Start shell in container by running  
`docker run -u 0 -it --rm -v $(pwd):/casio fxsdk-docker`  
This mounts the current working directory to `/casio` in the container.  

### USB support

fxSDK includes [p7utils](https://git.planet-casio.com/cake/p7utils), which can talk to calculators via USB or serial.  
If you want to use this, the docker container needs elevated privileges and mounts for `/dev` and `/sys`.  
This has security implications for your host machine, so make sure to not run untrusted code inside the container!  

`docker run -u 0 -it --rm -v /dev:/dev -v /sys:/sys --privileged -v $(pwd):/casio fxsdk-docker`