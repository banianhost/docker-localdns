FROM alpine

# MAINTAINER Pooya Parsa <pooya@pi0.ir>

RUN apk --no-cache add dnsmasq

EXPOSE 53 53/udp

ENTRYPOINT ["dnsmasq", "-kd"]

RUN echo "address=/local/127.0.0.1" >> /etc/dnsmasq.conf
RUN echo "address=/localhost/127.0.0.1" >> /etc/dnsmasq.conf
RUN echo "address=/dev/127.0.0.1" >> /etc/dnsmasq.conf
