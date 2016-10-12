alias change_passphrase='/usr/bin/sudo /usr/sbin/cryptsetup luksChangeKey /dev/lvmvolume/armory'
alias unlock='/usr/bin/sudo /usr/sbin/cryptsetup luksOpen /dev/lvmvolume/armory encryptedfs; mkdir /home/gpg/encryptedfs; /usr/bin/sudo /bin/mount /dev/mapper/encryptedfs /home/gpg/encryptedfs ; sudo chown -R gpg:gpg /home/gpg/encryptedfs'
alias lock='/usr/bin/sudo /bin/umount /home/gpg/encryptedfs'

export GNUPGHOME=/home/gpg/encryptedfs/.gnupg
