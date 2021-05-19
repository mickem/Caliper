FROM node:10-alpine

COPY . /usr/local/caliper/

ENV MINI_BREAKPAD_SERVER_PORT 8080

RUN apk add --no-cache -q git && cd /usr/local/caliper && npm install && ./node_modules/.bin/grunt && npm cache clean --force

RUN chmod 755 /usr/local/caliper/bin/caliper

EXPOSE  8080
VOLUME ["/usr/local/caliper/pool"]

WORKDIR /usr/local/caliper
CMD ["/usr/local/caliper/bin/caliper"]
