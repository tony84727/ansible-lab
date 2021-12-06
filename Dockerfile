FROM alpine:3.15.0

RUN apk add ansible openssh

ADD --chmod=0755 entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["sh"]