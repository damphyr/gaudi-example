# An example of Gaudi usage

## Assumptions

Gaudi makes heavy use of [Rake](https://github.com/ruby/rake) and its DSL.

Some knowledge of the Ruby language and its ecosystem _is_ required and language concepts will not be expanded upon due to time restrictions.

## Common base

To be able to work towards achieving the Gaudi goals, we first need to establish a consistent working environment.

To that end we will use a docker container image as our development environment.

To download and start the workshop _devenv_ pick an empty directory and do

### macOS

```sh
docker pull -q varzuehlke/gaudi-devenv:latest
docker run --privileged -it -v `pwd`:/workspace --env HOST_UID=$(id -u) --env HOST_GID=$(id -g) varzuehlke/gaudi-devenv:latest
```

### Windows

```sh
docker pull -q varzuehlke/gaudi-devenv:latest
docker run --privileged -it -v "%CD%":/workspace --env HOST_UID=1000 --env HOST_GID=1000 varzuehlke/gaudi-devenv:latest
```

----
[Approach](Approach.md) | [Start](Start.md)
