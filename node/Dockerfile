FROM alpine:3.15.0

RUN apk add openssh python3
ADD --chmod=0755 entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]