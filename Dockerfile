# stage1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --omit=dev


# stage2
FROM nginx:alpine
COPY --from=node /app/dist/docker_project /usr/share/nginx/html
