# LocalDNS

> Wildcard DNS to resolve `*.localhost`

## Quick run

```bash
docker run -p 53:53/tcp
           -p 53:53/udp
           --cap-add NET_ADMIN
           --name localdns
           localdns
```
```bash
# dnsmasq: started, version 2.76 cachesize 150
# dnsmasq: compile time options: IPv6 GNU-getopt no-DBus no-i18n no-IDN DHCP DHCPv6 no-Lua TFTP no-conntrack ipset auth no-DNSSEC loop-detect inotify
# dnsmasq: reading /etc/resolv.conf
# dnsmasq: using nameserver 192.168.65.1#53
# dnsmasq: read /etc/hosts - 7 addresses
```

## Using docker-compose

**docker-compose.yml**

```yml
version: '3'
services:
  localdns:
    image: banian/localdns
    container_name: localdns
    ports:
      - "53:53/tcp"
      - "53:53/udp"
    cap_add:
      - NET_ADMIN
    network_mode: bridge
    restart: always
```

## Test functionality:
```
$ nslookup foobar.local 127.0.0.1  
Server:         127.0.0.1
Address:        127.0.0.1#53

Name:   foobar.local
Address: 127.0.0.1
```

# License
MIT
