#!/bin/sh

set -e

rm       ${TARGET_DIR}/etc/dropbear
mkdir -p ${TARGET_DIR}/etc/dropbear

[ -x "$(command -v dropbearkey)" ] || (echo -e "\ndropbearkey is missing, please ensure that dropbear is installed\n"; exit 1)

dropbearkey -t rsa   -f ${TARGET_DIR}/etc/dropbear/dropbear_rsa_host_key
dropbearkey -t dss   -f ${TARGET_DIR}/etc/dropbear/dropbear_dss_host_key
dropbearkey -t ecdsa -f ${TARGET_DIR}/etc/dropbear/dropbear_ecdsa_host_key

[ -f $LOGIN_PUBKEY ]  || (echo -e "\ninvalid SSH public key path, aborting\n"; exit 1)
[ -f $GPG_PUBKEY ]    || (echo -e "\ninvalid SSH public key path, aborting\n"; exit 1)
[ -f $IMPORT_PUBKEY ] || (echo -e "\ninvalid SSH public key path, aborting\n"; exit 1)

mkdir -p ${TARGET_DIR}/home/gpg/.ssh

cp $LOGIN_PUBKEY ${TARGET_DIR}/home/gpg/.ssh/authorized_keys

echo "command=\"GNUPGHOME=/home/gpg/encryptedfs/.gnupg /usr/lib/qubes-gpg-split/gpg-server /usr/bin/gpg_led_wrapper usbarmory-gpg\",no-pty,no-port-forwarding,no-agent-forwarding,no-X11-forwarding $(cat ${GPG_PUBKEY})" >> ${TARGET_DIR}/home/gpg/.ssh/authorized_keys
echo "command=\"GNUPGHOME=/home/gpg/encryptedfs/.gnupg /usr/bin/gpg2 --import\",no-pty,no-port-forwarding,no-agent-forwarding,no-X11-forwarding $(cat ${IMPORT_PUBKEY})" >> ${TARGET_DIR}/home/gpg/.ssh/authorized_keys

cat << EOF > ${TARGET_DIR}/usr/bin/gpg_led_wrapper
#!/bin/sh

sudo /etc/init.d/S00ledon stop
sleep ${LED_TIMEOUT:-4} # default: 4s
sudo /etc/init.d/S99ledoff start

exec /usr/bin/gpg2 "\$@"

EOF

chmod 755 ${TARGET_DIR}/usr/bin/gpg_led_wrapper
