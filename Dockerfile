FROM maven:3.3-jdk-8-alpine AS bobthebuilder

WORKDIR /app
COPY . .

RUN apk update && apk add ca-certificates && update-ca-certificates && apk add openssl fontconfig ttf-dejavu

RUN mvn verify -Dlicense.skip=true

FROM openjdk:8-jre-alpine

WORKDIR /app

COPY --from=bobthebuilder /app/target ./target
COPY --from=bobthebuilder /app/src/main/webapp ./webapp
COPY --from=bobthebuilder /app/entrypoint.sh .

RUN chmod +x entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]

#ENTRYPOINT ["tail", "-f", "/dev/null"]
