# To build and run with Docker:
#
#  $ docker build -t ng2-quickstart .
#  $ docker run -it --rm -p 3000:3000 -p 3001:3001 ng2-quickstart
#
FROM node:latest

#RUN mkdir -p /quickstart /home/nodejs && \
#    groupadd -r nodejs && \
#    useradd -r -g nodejs -d /home/nodejs -s /sbin/nologin nodejs && \
#    chown -R nodejs:nodejs /home/nodejs

#WORKDIR /quickstart
#COPY package.json typings.json /quickstart/
#RUN npm install --unsafe-perm=true

#COPY . /quickstart
#RUN chown -R nodejs:nodejs /quickstart
#USER nodejs

#CMD npm start

RUN mkdir -p /usr/src/app
COPY package.json usr/src/app/
WORKDIR /usr/src/app

#RUN npm install -g grunt-cli bower # add other tools that you use too, e.g. `gulp`

RUN groupadd -r node \
&&  useradd -r -m -g node node

#COPY . /usr/src/app/
RUN chown -R node:node /usr/src/app

USER node
RUN npm install 
 #&& grunt build # required for staging

#ENV NODE_ENV development # production for staging
CMD [ "npm", "start" ]
EXPOSE 3000