sudo apt install qemu-kvm libvirt-daemon bridge-utils virtinst

virt-install \
  --accelerate --virt-type=kvm --os-variant=win10 \
  --ram=2048 --vcpus sockets=1,cores=1,threads=1 \
  --network network=isolated --name win10_64bit_001 \
  --disk path=/home/zer0py2c/win10_64bit_001.qcow2,size=25,bus=virtio,format=qcow2 \
  --disk path=/home/zer0py2c/virtio-win-0.1.173.iso,device=cdrom \
  --cdrom=/home/zer0py2c/Win10_1703_English_x64.iso \
  --graphics vnc,listen=0.0.0.0,port=5910,password=zer0py2C \
  --connect qemu:///system --noautoconsole
