FROM node:12.18.4
RUN mkdir /app
WORKDIR /app
COPY frontend/package.json /app/package.json
COPY frontend/package-lock.json /app/package-lock.json
RUN npm install
COPY frontend/ /app/
