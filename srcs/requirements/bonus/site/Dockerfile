FROM	alpine

RUN apk upgrade --available && apk add nodejs

COPY ./conf/index.html .
COPY ./conf/index.js .

CMD node index.js
