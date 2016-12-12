FROM alpine:3.4

RUN apk add --no-cache taskd

ENV TASKDDATA /var/taskd
RUN mkdir -p ${TASKDDATA} ${TASKDDATA}_certs

# for development
RUN apk add --no-cache bash

CMD taskd server --data ${TASKDDATA}
