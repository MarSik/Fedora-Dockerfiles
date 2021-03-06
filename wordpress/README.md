dockerfiles-fedora-wordpress
========================

(note: This originated from [jbfink](https://github.com/jbfink). I ported over to Fedora.)

Tested on Docker 0.7.0

(note: [Eugene Ware](http://github.com/eugeneware) has a Docker wordpress container build on nginx with some other goodies; you can check out his work [here](http://github.com/eugeneware/docker-wordpress-nginx).)

When you run the below commands, simply use sudo. This is a [known issue](https://twitter.com/docker/status/366040073793323008).)

This repo contains a recipe for making a [Docker](http://docker.io) container for Wordpress, using Linux, Apache and MySQL on Fedora. 
To build, make sure you have Docker [installed](http://www.docker.io/gettingstarted/), clone this repo somewhere, and then run:

```
# docker build --rm -t <yourname>/wordpress .
```

Run it:

```
# CID=$(docker run -d -p 80 <yourname>/wordpress)
```

Check docker logs after running to see MySQL root password and Wordpress MySQL password, as so:

```
# echo $(docker logs $CID | grep password)
```

(note: you won't need the mysql root or the wordpress db password normally)

Then find the external port assigned to your container:

```
# docker port $CID 80 
```

Visit in a webrowser, then fill out the form. No need to mess with wp-config.php, it's been auto-generated with proper values. 



