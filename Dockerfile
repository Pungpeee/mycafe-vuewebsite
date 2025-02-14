FROM node:latest as build-stage
COPY package*.json ./
RUN npm install
COPY ./ .
RUN npm run build

FROM nginx as production-stage
COPY --from=build-stage /dist /usr/share/nginx/html
