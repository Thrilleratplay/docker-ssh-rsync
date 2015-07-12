##docker-ssh-rsync
A tiny (virtual size: 10.74 MB) SSH and rsync Docker image.

###Why?
For use with rsync type backup applications like [rsync](https://rsync.samba.org/), [rsnapshot](http://rsnapshot.org/), or [Back In Time](http://backintime.le-web.org/)


####Basic usage
* Clone this repo
* Add `authorized_keys` file into cloned repo directory
* Build.
```
# This will build the docker image and tag it as "ssh-rsync-image"
docker build --no-cache --rm -t "ssh-rsync-image" .
```
* Run.
```
# This will
# * Create a background running container named "ssh-rsync-server"
# * Expose and publish guest port 22 to host port 2222
# * Bind host directory /data/docker/backup to docker directory /data/backup
docker run -itdP -p 2222:22 -v /data/docker/backup:/data/backup --name ssh-rsync-server ssh-rsync-image
```
