# Dockerfile

FROM node:12.13.0-alpine
RUN mkdir -p /opt/app
WORKDIR /opt/app
RUN adduser -S app
RUN chown -R app /opt/app
COPY ./addressbook .
RUN npm update
RUN npm install
RUN npm install pm2
USER app
EXPOSE 3000
CMD [ "npm", "run", "pm2" ]