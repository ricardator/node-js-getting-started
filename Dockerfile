FROM node:12.13.0-alpine

WORKDIR /app

COPY package*.json ./
COPY *.js ./

RUN npm ci

COPY . .

CMD [ "npm" , "start"]
