FROM snappybeebit/odin:alpine-tests
WORKDIR /test
COPY . .
ENV TZ="America/Lima"

RUN odin build .
CMD ["./test"]
