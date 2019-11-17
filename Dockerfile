FROM node:11

ENV NODE_ENV production
WORKDIR /usr/src/app

COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../

COPY . .

ENV PORT 80
EXPOSE 80

RUN mkdir -p /data/db
ENV DB_URL /data/db

RUN mkdir -p /data/sessions
ENV SESSION_STORE /data/sessions

ENV SECRET_DIRNAME /data

CMD npm start