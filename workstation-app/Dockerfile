FROM node:14

WORKDIR /workstation-app
COPY package.json .
RUN npm install
COPY . .
CMD npm start

