# kickstart
### 基本自动化安装配合cobbler

引导镜像制作
1、拷贝镜像内容
```
#mkdir /mnt/cdrom
#mount /dev/sr0 /mnt/cdrom
#mkdir /tmp/iso
#cp -r /mnt/cdrom/ /tmp/iso
```
2、
将预先制作好的 kickstart 文件也放入/tmp/iso目录中
3、
编辑/tmp/iso/isolinx/isolinux.cfg 文件，使其在安装时直接使用 kickstart 配置文件
在文件中找到 label linux 菜单项，在 append 指令后附加 ks 设置，如：
 label linux   
 menu label ^Install or upgrade an existing system
 menu default
 kernel vmlinuz
 append initrd=initrd.img ks=cdrom:/ks.cfg
4、创建 iso 镜像：
#/tmp/目录下执行  
mkisofs -R -J -T -v --no-emul-boot --boot-load-size 4 --boot-info-table -V "CentOS 6.7 I386 boot disk" -b isolinux/isolinux.bin -c isolinux/boot.cat -o /root/boot.iso iso/
