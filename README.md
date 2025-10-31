# docker-node-oracle-nodemon

![GitHub workflow](https://github.com/thesuhu/docker-node-oracle-nodemon/actions/workflows/docker-image.yml/badge.svg) ![Docker pull](https://img.shields.io/docker/pulls/thesuhu/docker-node-oracle-nodemon) [![license](https://img.shields.io/github/license/thesuhu/docker-node-oracle-nodemon)](https://github.com/thesuhu/docker-node-oracle-nodemon/blob/master/LICENSE)

Docker images used to create containers ready with Node.js, Oracle Client and Nodemon. This docker image is recommended for development only. For production use [docker-node-oracle-pm2](https://github.com/thesuhu/docker-node-oracle-pm2) instead.

## Usage

Just run the following command to run the container:

```
docker run -d -t -p <host port>:<your app port> -v <your app host dir>:/usr/src/myapp --name <your container name> thesuhu/docker-node-oracle-nodemon:{TAG}
```

Specify the image tag you will use in the above *{TAG}*. Available tags and their Node / Nodemon details are listed below.

| Image Tag | Node | Nodemon |
|-----------|------:|---------|
| latest    | v22.x (based on node:22) | installed at build time (unpinned) |
| 22        | v22.x | installed at build time (unpinned) |
| 14        | v14.x | v6.x (historical) |

Note: historically, tag `22` previously pointed to Node v14 with nodemon v6.x.

## Example

```
docker run -d -t -p 3000:3000 -v /home/thesuhu/helloworld:/usr/src/myapp --name backend thesuhu/docker-node-oracle-nodemon:22
```

Once the container is running, open a terminal inside the container and run `npm i`. Finally, use `nodemon` to start your application. The application automatically restart every time there is a change in the host directory

## License

[MIT](https://github.com/thesuhu/docker-node-oracle-nodemon/blob/master/LICENSE)

