#!/bin/sh

cat > /etc/network/interfaces << EOF
auto eth0
iface eth0 inet dhcp
EOF

mkdir /etc/docker
cat > /etc/docker/daemon.json << EOF
{
    "hosts": ["tcp://0.0.0.0:2375"],
    "tls": false
}
EOF

rc-update add docker boot
rc-update add networking boot
