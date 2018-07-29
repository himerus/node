# Node

> Node image for a JavaScript server side platform.

[![GitHub tag](https://img.shields.io/github/tag/himerus/node.svg)](https://github.com/himerus/node)
[![Docker Stars](https://img.shields.io/docker/stars/himerus/node.svg)](https://hub.docker.com/r/himerus/node)
[![Docker Pulls](https://img.shields.io/docker/pulls/himerus/node.svg)](https://hub.docker.com/r/himerus/node)

For more documentation on how Outrigger images are constructed and how to work
with them, please [see the documentation](http://docs.outrigger.sh/).

## Node v8+

Based on official Node images, specifically the Alpine variant, and
adds special functionality on top. Currently that includes:

* tini init system
* Coordinated support for Yarn and npm
* Run services as the `node` user instead of as `root`.

We have switched to a simple templating mechanism to ease support for multiple node versions, assuming we want to handle future node versions in a manner identical
to v8.

## Usage Example

The examples in this repo use Yarn, but you can use npm as well.

### Docker Run - Node REPL

```bash
docker run --rm -it himerus/node:8
```

### Docker Compose - Project-style

For a more thorough example of how you would use himerus/node:8 or greater
in a "real" project, check out ./examples.

```yaml
api: '3.4'
services:
  app:
    image: himerus/node:10
    container_name: projectname_app
    command: "yarn install && yarn start"
    labels:
      com.dnsdock.name: app
      com.dnsdock.image: projectname
    network_mode: bridge
    volumes:
      - .:/code
```
