#!/bin/sh

java -Xms64m -Xmx128m -Ddatasource.dialect="MYSQL" \
-Ddatasource.url="jdbc:mysql://db:3306/lavagna?useSSL=false" \
-Ddatasource.username="root" \
-Ddatasource.password="123" \
-Dspring.profiles.active="dev" \
-jar target/lavagna-jetty-console.war --headless
