stop_rootfs(){
if [[ "$(cat $rootfs/dogeland/status)" != "Run" ]]
then
echo "">/dev/null
else
pkill sshd
pkill dropbear
echo "Stop">$rootfs/boot/dogeland/status
pkill proot
$TOOLKIT/proot -r $TOOLKIT -b /system -b /proc -b /sys -b /dev -b /vendor -b /apex /busybox pkill $PACKAGE_NAME
pkill $PACKAGE_NAME
pkill sh # for chroot
fi
}