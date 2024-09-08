FROM node:22.8.0-alpine3.19
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build
ENTRYPOINT npm start