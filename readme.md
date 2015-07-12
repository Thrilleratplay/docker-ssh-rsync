##docker-ssh-rsync
A tiny (virtual size: 10.74 MB) SSH and rsync Docker image.

###Why?
For use with rsync type backup applications like [rsync](https://rsync.samba.org/), [rsnapshot](http://rsnapshot.org/), or [Back In Time](http://backintime.le-web.org/)


####Basic usage
* Clone Repo
* Add authorized_keys file into cloned repo directory
* build
```
docker build --no-cache --rm -t "rsyncd-image" .
```
* run
```
docker run -itdP -p 2222:22 -v /data/docker/backup:/data/backup --name rsyncd-server rsyncd-image
```
