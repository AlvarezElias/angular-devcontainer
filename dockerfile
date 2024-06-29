FROM node:20 as build
RUN npm install -g @angular/cli

WORKDIR /src

COPY package.json .
COPY package-lock.json .
RUN npm install

COPY . .
RUN ng build

FROM nginx:latest
WORKDIR /usr/share/nginx/html
COPY --from=build /src/dist/demo/browser .