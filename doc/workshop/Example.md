# An example of Gaudi usage

To be able to work towards achieving the Gaudi goals, we first need to establish a consistent working environment.

To that end we will use a docker container image as our development environment.

To download and start the workshop _devenv_ do

## macOS

```sh
docker pull -q varzuehlke/gaudi-devenv:latest
docker run --privileged -it --env HOST_UID=$(id -u) --env HOST_GID=$(id -g) varzuehlke/gaudi-devenv:latest
```

## Windows

```sh
docker pull -q varzuehlke/gaudi-devenv:latest
docker run --privileged -it --env HOST_UID=1000 --env HOST_GID=1000 varzuehlke/gaudi-devenv:latest
```

----
[Context](Context.md) | [Scaffold](01.md)