# base image
FROM node:16

# set working directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json /usr/src/app/package.json
COPY package-lock.json /usr/src/app/package-lock.json
RUN npm install -d --production

# copy the client directory into the container
COPY . /usr/src/app


# stage2
FROM nginx:alpine
COPY --from=node /app/dist/docker_project /usr/share/nginx/html
