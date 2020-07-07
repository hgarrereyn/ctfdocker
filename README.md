
# CTF Docker

This is a WIP, some things may be broken.

# Docker scripts 

Run `build.sh` to build docker images.

Run `<image>.sh <path>` to spawn a new container with `docker run`. (path is mounted at `/home/work`)

Run `<image>.sh` with an already running container to attach a new shell with `docker exec`.

# Helper scripts

Inside a container, the following scripts are available:

`serve <binary> <port>` to start a socat instance listening on this port (e.g. to simulate how a ctf challenge is run)

`d <binary>` to watch for new processes spawned with this name and automatically attach gdb.

# Example

For most ctf challenges, I set up my environment like so:

Window 1
```sh
$ ./pu18.sh <path/to/ctf>
(inside container)
$ serve ./challenge 8018
```

Window 2
```sh
$ ./pu18.sh
(inside container)
$ d ./challenge
```