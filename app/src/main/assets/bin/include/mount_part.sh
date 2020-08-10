#
# DogeLand CLI Module
# 
# license: GPL-v2.0
#
mount_part(){
if [ -d "$rootfs/proc/1/" ];then
 echo "">/dev/null
  else
 echo "- /proc ..."
   mount -t proc proc $rootfs/proc
fi
if [ -d "$rootfs/sys/kernel/" ];then
 echo "">/dev/null
  else
 echo "- /sys ..."
  mount -t sysfs sysfs $rootfs/sys
fi
if [ -d "$rootfs/mnt/sdcard" ];then
  echo "">/dev/null
  else
  echo "- /sdcard ..."
  if [ -d "$rootfs/mnt/sdcard" ];then
  echo "">/dev/null
  else
  mkdir $rootfs/mnt/sdcard
  fi
  mount -o bind $SDCARD_PATH $rootfs/mnt/sdcard
fi
if [ -d "$rootfs/dev/block/" ];then
  echo "">/dev/null
  else
  echo "- /dev ..."
  mount -o bind /dev/ $rootfs/dev
fi

if [ -d "$rootfs/dev/pts/" ];then
  echo "">/dev/null
  else
  echo "- /dev/pts ..."
  mount -t devpts devpts $rootfs/dev/pts
fi

if [ ! -e "/dev/tty0" ]; then
  echo "">/dev/null
  else
  echo "- /dev/tty ... "
  ln -s /dev/null /dev/tty0
fi

}