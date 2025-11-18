FROM snappybeebit/odin:alpine-tests
WORKDIR /test
COPY . .


RUN odin build .
CMD ["./test"]
