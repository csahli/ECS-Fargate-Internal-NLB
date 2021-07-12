#!/bin/bash

openssl req -config sslconfig.conf -new -nodes -x509 -newkey rsa:2048 -sha256 -keyout server.key -out server.crt -days 3650
openssl pkcs12 -export -in server.crt -inkey server.key -certfile server.crt -out server.p12 -passout pass:pass123
keytool -importkeystore -srckeystore server.p12 -srcstoretype pkcs12 -destkeystore server.jks -deststoretype JKS
cp server.jks server.p12 ../docker-spring-boot/src/main/resources/keystore/

