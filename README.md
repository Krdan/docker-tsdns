[![](https://images.microbadger.com/badges/image/krdan/tsdns.svg)](https://microbadger.com/images/krdan/tsdns "Get your own image badge on microbadger.com")

docker-tsdns
============

This image is based on [solidnerd/docker-tsdns](https://github.com/SolidNerd/docker-tsdns). 

# Current Version: [3.9.1](https://github.com/Krdan/docker-tsdns/blob/master/Dockerfile)
Base image: frolvlad/alpine-glibc:alpine-3.9
# Getting Started

1. Copy the `tsdns_settings.ini.sample` to add your host with
```
docker run --rm --entrypoint="/bin/sh" krdan/tsdns:3.8.0 -c "cat tsdns_settings.ini.sample" > tsdns_settings.ini
```
2. Add your entries in `tsdns_settings.ini`
```
public.teamspeak.com=12.13.14.15:10000
```

3. Start the container
```
docker run -d -p 41144:41144 -v $(pwd)/tsdns_settings.ini:/var/tsdns/tsdns_settings.ini:ro --name tsdns krdan/tsdns:3.9.1
```

# Update TSDNS Entries
Edit your file on your Host.
After this restart your container with:
```
docker restart  tsdns
```
Now the TSDNS resolves your entries.

# LICENSE
[MIT](https://github.com/Krdan/docker-tsdns/blob/master/LICENSE)
