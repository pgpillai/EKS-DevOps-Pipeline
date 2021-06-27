# Dockerfile

FROM node:12.13.0-alpine

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE  3000

CMD [ "npm", "run", "pm2" ]
