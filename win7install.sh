sudo apt-get install -y qemu-kvm \ # 提供虚拟机硬件、外设模拟功能
	libvirt-bin \ # libvirt API+libvirtd+virsh
	python-libvirt \ # python libvirt API
	bridge-utils \ # 网桥管理工具（非必须）
	virtinst \ # 客户机安装的命令行工具 virt-install
	virt-manager # 客户机的图形化管理工具（非必须）

# 宿主机操作系统：Ubuntu18.04
virt-install \
	--accelerate \ # 加速选项（默认）
	--virt-type=kvm \ # 指定所使用的虚拟化管理工具为KVM
	--os-variant=win7 \ # 指定客户机的操作系统类型
	--cdrom=/home/zer0py2C/virtio-win-0.1.173.iso # 指定驱动镜像（KVM采用半虚拟化模式）
	--ram=2048 \ # 分配最大运行内存，单位MB
	# --cpu host-passthrough \ # 客户机直接使用物理CPU，如果宿主机CPU资源充足，建议直接以该CPU模式运行
	--vcpus sockets=1,cores=1,threads=1 \ # 否则，使用QEMU模拟出与宿主机CPU型号最接近的虚拟CPU
	--network network=isolated \ # 配置隔离网络模式（需要提前配置isolated虚拟网桥）
	--name win7_64bit_001 \ # 客户机名称
	--disk path=/home/zer0py2C/cn_windows_7_ultimate_with_sp1_x64_dvd_u_677408.iso,device=cdrom \
	--disk path=/home/zer0py2C/win7_64bit_001.qcow2,size=25,bus=virtio,format=qcow2 \ # 指定虚拟磁盘镜像
	--graphics vnc,listen=0.0.0.0,port=5910,password=zer0py2C \ # 配置VNC服务
	--connect qemu+tcp://{host_ip}:16509/system \
	--noautoconsole # 禁止自动尝试连接客户机
