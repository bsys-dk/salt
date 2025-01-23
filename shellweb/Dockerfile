FROM alpine
LABEL org="BSYS" \
      maintainer="Brian Westy" \
      version="2.0"
ENV version 2
RUN mkdir app && apk add --no-cache --upgrade bash
WORKDIR /app
EXPOSE 8080
COPY . .
RUN chmod 777 shellweb.sh
ENTRYPOINT [ "./shellweb.sh" ]