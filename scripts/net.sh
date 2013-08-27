( cat <<EOP
UseDNS=no
EOP
) >> /etc/ssh/sshd_config

( cat <<EOF
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet dhcp
EOF
) > /etc/network/interfaces

( cat <<EOF
<?xml version="1.0" standalone='no'?><!--*-nxml-*-->
<!DOCTYPE service-group SYSTEM "avahi-service.dtd">
<service-group>
    <name replace-wildcards="yes">%h</name>
    <service>
        <type>_ssh._tcp</type>
        <port>22</port>
    </service>
</service-group>
EOF
) > /etc/avahi/services/ssh.service

( cat <<EOF
allow-interfaces=eth1
enable-dbus=no
EOF
) >> /etc/avahi/avahi-daemon.conf

ifup eth1
service avahi-daemon restart

ufw allow in on lxcbr0
ufw allow out on lxcbr0
