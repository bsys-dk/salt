# Timeservice build script
FROM alpine
LABEL org="BSYS" \
      maintainer="Brian Westy" \
      version="1.0.1"
ENV version 1
RUN mkdir app && apk add --no-cache bash
WORKDIR /app
EXPOSE 8080
COPY timeservice.sh service.sh
RUN chmod 777 service.sh
ENTRYPOINT [ "./service.sh" ]