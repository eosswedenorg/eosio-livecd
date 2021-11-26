#!/bin/bash

source config.sh

# Clear and create directories.
rm -fr image/*
mkdir -p image/{casper,isolinux,install}

# Copy kernel images
sudo -S cp rootfs/boot/vmlinuz-* image/casper/vmlinuz
sudo -S cp rootfs/boot/initrd.img-* image/casper/initrd

# Copy memtest BIOS
sudo -S cp rootfs/boot/memtest86+.bin image/install/memtest86+

# Copy memtest UEFI
UEFI_MEMTEST_CACHE=.cache/memtest86-uefi.zip
if [ ! -f ${UEFI_MEMTEST_CACHE} ]; then
    wget https://www.memtest86.com/downloads/memtest86-usb.zip \
        -O ${UEFI_MEMTEST_CACHE}
fi

unzip -p ${UEFI_MEMTEST_CACHE} memtest86-usb.img > image/install/memtest86

#
# Grub config
#

touch image/ubuntu
cat <<EOF > image/isolinux/grub.cfg
search --set=root --file /ubuntu
insmod all_video
set default="0"
set timeout=30
menuentry "Boot ${GRUB_BOOT_LABEL}" {
   linux /casper/vmlinuz boot=casper quiet splash ---
   initrd /casper/initrd
}
menuentry "Boot ${GRUB_BOOT_LABEL} (safemode)" {
   linux /casper/vmlinuz boot=casper nomodeset quiet splash ---
   initrd /casper/initrd
}
menuentry "Check disc for defects" {
   linux /casper/vmlinuz boot=casper integrity-check quiet splash ---
   initrd /casper/initrd
}
EOF

# Manifest
sudo -S chroot rootfs dpkg-query -W --showformat='${Package} ${Version}\n' | sudo tee image/casper/filesystem.manifest > /dev/null
sudo -S cp -v image/casper/filesystem.manifest image/casper/filesystem.manifest-desktop
sudo -S sed -i '/ubiquity/d' image/casper/filesystem.manifest-desktop
sudo -S sed -i '/casper/d' image/casper/filesystem.manifest-desktop
sudo -S sed -i '/discover/d' image/casper/filesystem.manifest-desktop
sudo -S sed -i '/laptop-detect/d' image/casper/filesystem.manifest-desktop
sudo -S sed -i '/os-prober/d' image/casper/filesystem.manifest-desktop

# Compress filesystem.
sudo -S mksquashfs rootfs/ image/casper/filesystem.squashfs \
    -wildcards \
    -e "var/cache/apt/archives/*" \
    -e "root/*" \
    -e "root/.*" \
    -e "tmp/*" \
    -e "tmp/.*" \
    -e "swapfile" \
    -e "scripts"

# Write filesystem size
printf $(sudo -S du -sx --block-size=1 rootfs | cut -f1) > image/casper/filesystem.size

# Write diskdefines
cat <<EOF > image/README.diskdefines
#define DISKNAME  ${GRUB_BOOT_LABEL}
#define TYPE  binary
#define TYPEbinary  1
#define ARCH  amd64
#define ARCHamd64  1
#define DISKNUM  1
#define DISKNUM1  1
#define TOTALNUM  0
#define TOTALNUM0  1
EOF

pushd image > /dev/null

# install grub (UEFI)
grub-mkstandalone \
   --format=x86_64-efi \
   --output=isolinux/bootx64.efi \
   --locales="" \
   --fonts="" \
   "boot/grub/grub.cfg=isolinux/grub.cfg"

# install grub (BIOS)
(
   cd isolinux && \
   dd if=/dev/zero of=efiboot.img bs=1M count=10 && \
   sudo -S mkfs.vfat efiboot.img && \
   mmd -i efiboot.img efi efi/boot && \
   mcopy -i efiboot.img ./bootx64.efi ::efi/boot/
)

# Create grub image
grub-mkstandalone \
   --format=i386-pc \
   --output=isolinux/core.img \
   --install-modules="linux16 linux normal iso9660 biosdisk memdisk search tar ls" \
   --modules="linux16 linux normal iso9660 biosdisk search" \
   --locales="" \
   --fonts="" \
   "boot/grub/grub.cfg=isolinux/grub.cfg"

cat /usr/lib/grub/i386-pc/cdboot.img isolinux/core.img > isolinux/bios.img

# Generate md5sum.txt
sudo -S /bin/bash -c "(find . -type f -print0 | xargs -0 md5sum | grep -v "\./md5sum.txt" > md5sum.txt)"

mkdir -p ../output

# Now create the iso.
sudo -S xorriso \
   -as mkisofs \
   -iso-level 3 \
   -full-iso9660-filenames \
   -volid "${TARGET_NAME}" \
   -eltorito-boot boot/grub/bios.img \
   -no-emul-boot \
   -boot-load-size 4 \
   -boot-info-table \
   --eltorito-catalog boot/grub/boot.cat \
   --grub2-boot-info \
   --grub2-mbr /usr/lib/grub/i386-pc/boot_hybrid.img \
   -eltorito-alt-boot \
   -e EFI/efiboot.img \
   -no-emul-boot \
   -append_partition 2 0xef isolinux/efiboot.img \
   -output "../output/${TARGET_FULLNAME}.iso" \
   -graft-points \
      "." \
      /boot/grub/bios.img=isolinux/bios.img \
      /EFI/efiboot.img=isolinux/efiboot.img

popd > /dev/null

pushd output > /dev/null
md5sum ${TARGET_FULLNAME}.iso > ${TARGET_FULLNAME}.md5
popd > /dev/null
