# docker-node-oracle-nodemon

![GitHub workflow](https://github.com/thesuhu/docker-node-oracle-nodemon/actions/workflows/docker-image.yml/badge.svg) ![Docker pull](https://img.shields.io/docker/pulls/thesuhu/docker-node-oracle-nodemon) [![license](https://img.shields.io/github/license/thesuhu/docker-node-oracle-nodemon)](https://github.com/thesuhu/docker-node-oracle-nodemon/blob/master/LICENSE)

Docker images used to create containers ready with Node.js, Oracle Client and Nodemon. This docker image is recommended for development only. For production use [docker-node-oracle-pm2](https://github.com/thesuhu/docker-node-oracle-pm2) instead.

## Usage

Within your Dockerfile:

```
FROM thesuhu/docker-node-oracle-nodemon:{VERSION}
```

## Versions

Specify the Node.js version you will use in the above *{VERSION}*. Node.js version 14 or above is available.

## Example

Create Dockerfile as you need.

```
FROM thesuhu/docker-node-oracle-nodemon:14

RUN mkdir -p /usr/src/myapp
WORKDIR /usr/src/myapp

COPY <host directory>/. .

RUN npm i --verbose

CMD npm run dev
```

Build the Dockerfile.

```
docker build -t <image name> .
```

Then create container with mount bind to the host project directory.

```
docker run -d -p 3000:3000 -v <host directory>:/usr/src/myapp --name <container name> <image name>
```

The application will be running well and automatically restart every time there is a change in the host directory

## License

[MIT](https://github.com/thesuhu/docker-node-oracle-nodemon/blob/master/LICENSE)

