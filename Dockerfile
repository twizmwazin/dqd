FROM alpine:3.13

RUN apk add qemu-system-x86_64

ADD system.qcow2 /system.qcow2

CMD qemu-system-x86_64 \
      -hda system.qcow2 \
      -enable-kvm \
      -smp 8 \
      -m 8G \
      -nic user,model=virtio-net-pci,hostfwd=tcp::2375-:2375 \
      -nographic

