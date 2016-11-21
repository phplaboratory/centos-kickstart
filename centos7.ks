
#version=RHEL7
# System authorization information
auth --enableshadow --passalgo=sha512
# Use CDROM installation media
eula --agreed
reboot
# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'
# System language
lang en_US.UTF-8

rootpw --iscrypted $6$g2KwwBC2mn$Lxt2E8hrA.Fb6steIEmmgNKOFhYcyeymhAaHqnECKNu36xp5sei2LBl1atLHcVWEa74Ggcsn346N1JE64OGWp0
# System timezone
timezone Europe/London --isUtc
# Run the Setup Agent on first boot
firstboot --disable
ignoredisk --only-use=vda
zerombr
clearpart --all --initlabel --drives=vda

# System bootloader configuration
#Partition clearing information
part / --fstype="ext4" --ondisk=vda --size=1 --asprimary --grow
part swap --recommended
bootloader --location=mbr --boot-drive=vda


user --groups=wheel --name=admin --password=$6$HqS6tEQZKMzZXRqT$T1dmqcISnQQtVR.u/Sh56jKr75bS2JwZe20PddB/Ab1kT2291igLp8AA5VX7vlhbl9WJHtMKyMlrxeHB7ghjK1 --iscrypted --gecos="admin"

%packages
@core
@base
%end

%post
(
cd /root
mkdir --mode=700 .ssh
cat >> .ssh/authorized_keys << "PUBLIC_KEY"
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDn8IrSHYNdHAnQ8uCr/h0jZQyAJVpJWPdsv9deWlJzEDtJjdnWZqdfS21bJa/hMdQZGuDKdfkQjwJhVXabHrioo9bztYGcLNmq1+5HZRaXqX8vGZrqT8y+mqyAVT9nsn6gsy6pc13cHjSudsTozgpishbLXmuz/vfqrUCFd2JTDcQ+vmdhA5MM/WxUz9pCRscDU440GPyejWvjuOjQOyNhE1zZOt+DK26QOivcXHXbGBDo2kukNYDR9bpfl2aCgERUKvrGugKtAW5YhsTSeN0HVd7J1fRljd7GROJ4R5lmyqh4I1rBM+IvOIfIKcUk1wJ++DpAUHzKI8Jb4QFvoTg3CXs0sP4GMpIPoeGYLkeowQUxL2J2UZmwV5IRB6iAjJOhOR4BZ5o7p4SmBcaITAHjSXHKwvAApZcVUzTlh5/6DlqpL303tG3clgy/jGJPHJloKalQVVc9p4vT2P6SJzsJ75hy13KuDY5KCfbuzBe0dHBSK7v/CHangEmDWAWFmwf3tn2Ikb+rgnNkB6D/xpplvfoGuTZWjIKdv4oBNelIsvZm3o0nE3xkWJucFup0xUhvcQQlbxDtyqRPpEpY2V8K5VMaLFQ2XhvRHAAWoSIkvE+k8yjQsm7Z5G/71Z52lD9sMNg4Gr+LJyrvOWPIApuuuW8dKp0zqiZP63mEmDZuJw== no@no.com
PUBLIC_KEY

cat >> .ssh/authorized_keys << "PUBLIC_KEY"
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDXht+2ufUOI4zSV8C4razLrOaXZHHABBDrHG40yj1dmvL1XkxpiLjvlqqB1G6fYe4xRAxZxOi0i0icfG4NSob9GYQvhCk2wkh5+RJe7vZhDDnas7GwD/OmVFctMmFPqXurYj9yS4ylfNJVOa4iC5Cq2GdxQHtgWKV3XRpayE/8i4VD5ORPAhhjvWDtRDFO6Qla5dM+ye2323EeYmNdJdvSd1eivHA7XorzDBnws4OomUrJ8s0zKr5PChyO3gGU+2khbXkemh1Zs7TlQQ71LgZdUFdnZMv+1xD4lwQ046dkBbEyxmlH338jdGV/najpsfAFSCvZ/Nt4jSEwkljIxLJv root@osboxes
PUBLIC_KEY

cat >> .ssh/authorized_keys << "PUBLIC_KEY"
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDiYMEcZd2xbd6x4Dufue9H7S0CPwa7rWlymp0wTm5gG16muzYfJdW9S2DkNFdfEhGlJBfrYeGoKzVFGT4IRgNTOpHQzJX2mwyi/PcIn4RuOkQFP1Q0fCX3KKlq89+HS2DC0P4eJR7m78ku9AYnL9rucAyFvWgvB952mJTGuEjl2svpyo56C8X3IAPnOCfqujYgx47dqqONnXfKZmS2cF5UacicN5buu71Jm3MmG8oXWAIgRmP8HX0J5q+g17Qu+ytPEFxAw02nJvsuIHsXoSBQF/EKnnXIJ8vIzJC7aK73w2ihCF/crjWYxU3h2IRyt/xdQCuoZ2fbR0/L3ODZc50t root@galactica.rzr.io
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDT0/rXGQrdpoFID7qghYVZgGSCv5lW0QNkKbwTqpqSt7GKYi8rwI9iaC4dsaKUnJIxvjjjlcyTsV+yQc12mzXq+J6eVlVDVXcmoV03kARrQyzqaSCwmMhsBO5trO761eBpwNAbkLhIjXRRSYD6slJddXrifY8h6fomSM+xg01B8pQ+6WjlYZ15zyzFP2s/pt+g3443fv/mNz7+fC5rM8b3XuA0diO1M2h3pwbwY1cCBYIoQIyLQDcMOQ7k9rBvvcrSBplP6IZ4f4z7gL8ATL7CXwZOy9T6a4KnnYY2d4dcOTBEtKeuRTuZd4hvvZfVdZLnaBdfJKFY5z1SJJDl8P3F root@athena.rzr.io
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD5gt2imp35Z+PYcyYSB99KnI1wCkP9Ogk40Jnz0d0QwvnltV5AG2/fP0ClKz31a2Iyl7Wgad+g6PUuBJ/guj9P6txPsM0gDdj8+Tc6RE6JAEEUHZ7NYPQs3L1kdqez+eRGAhtcSV/1CaH+/swXh3i5VvvgdT5q30YMwJrW/i2CPYFmn/z6VAD9ISYqBnQa3LdcAF7NPuOAVxzrTPEHW6iU1Ham3TOaA5hLCHtW2IOCE6FikQQZClzdjdO3JDPpSs2n826P5swUuJWM2In6VvVk6EvsMD0TEoLmP9UsjzwYmuLmHDG5l9OJy3l48Q5o87GXEDp7otDVeyX/1c1li6q9 root@pacifica.rzr.io
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDr2hfll6W9GSKdZ0geLhYWlXtctdudxiMMh26cV/DPRdmHMjdQP0ba1BPvKbHLn4iebVG+nICkG9o8gv1JjG/0u4B6ldDVrU4GOYkcsaxUA7445O7mikqhjPb7O9IKT0JG2cw92Dwzb0xgnVnxPCMV5BewiOfzheJ3QLGLAVLSLsJjerCeVYmNbfFGoeZppxHR1XLtnY9We+N36UWuc+QGhmT0r276D+MmjjvVt7brZkJrf3ZFHib+XSSObLyHjiExC/NMNxPP1nORk/ui8wrU2zI+V2k28ETWMkpfNXWduHzT96yfW8EnDpJxuCkEsknWJAZ1kFZBtSmQ4C7uBkub root@cerberus.rzr.io
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD0tyBB+cINkPUYMl8cGOD7gXVFq0lOAMIPcQmZrq73WGSfnIV2p3Geeti1V6T8krd+XwlwnPPylmNYpcM9JvL6LUWZS8NjEe/0T0gVlBX5TAgRbppxOS5TCIN09YlXKqB1+PIVeenHVtKHllKBCNNeLhiyMM54Hm7ro9agMb9ZRmvZy+bsW5+f87GKiCwUPO9RNTKUnRZke/NogFiN+W2k+nfE7QZG5Ds2kxwUAN8iK7L9Rdk8khC4mFbiJQDDH+uKV1EdqJRCrASMxvWjAP/9ta2RVdie6aFqPHtb6sQaSP44R31DJb7lLATrZhp8Z5FL60gqicdL5PqjVZJOjoMT root@pegasus.rzr.io
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8QY4Et2FzEXhA64frBZwHNf5q1r+xzbaogyufM8cZ/rQJONCFVSiRxFh6XBYcBnNVUCESv4YgEt1UmALMGpXzBGlnDYP1Faikd1GRQz4GxJKkl6/u4IMRIlKLGsSNAngerlj8a8U7ZKyOaX98ApjqSHH7R9ejv8XgqRNnKdc4oleRorhII4AEM2p2bz6Knqa0cpfIMrJku4brYRheiNxJCOXv3/ed95ptrObnbsqP8A2pdASumB8ma4Xvf5QoZx5/OPBBPpLt79pJ2C+yL7T1jDbKETAQL6tckGdyUTs8YL3JTA/BZZIkKeFoD3StSmeXbfEXTaf7VCagd1HiGwCv root@prometheus.rzr.io
PUBLIC_KEY


chmod 600 .ssh/authorized_keys

# set static IP
# set DNS
echo "PEERDNS=no" >> /etc/sysconfig/network-scripts/ifcfg-eth0
# set ovh repository


cat <<EOF >/etc/yum.repos.d/CentOS-Base.repo

[base]
name=CentOS-$releasever - Base
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/os/$basearch/
baseurl=http://centos.mirrors.ovh.net/ftp.centos.org/$releasever/os/$basearch/

gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#released updates 
[updates]
name=CentOS-$releasever - Updates
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=updates&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/updates/$basearch/
baseurl=http://centos.mirrors.ovh.net/ftp.centos.org/$releasever/updates/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#additional packages that may be useful
[extras]
name=CentOS-$releasever - Extras
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=extras&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/extras/$basearch/
baseurl=http://centos.mirrors.ovh.net/ftp.centos.org/$releasever/extras/$basearch/
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

#additional packages that extend functionality of existing packages
[centosplus]
name=CentOS-$releasever - Plus
#mirrorlist=http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=centosplus&infra=$infra
#baseurl=http://mirror.centos.org/centos/$releasever/centosplus/$basearch/
baseurl=http://centos.mirrors.ovh.net/ftp.centos.org/$releasever/centosplus/$basearch/
gpgcheck=1
enabled=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

EOF










#tinc
yum install epel-release -y
yum --enablerepo=epel-testing install tinc -y
yum upgrade --assumeyes --tolerant
yum update --assumeyes

yum install iptables-services -y
systemctl stop firewalld
systemctl mask firewalld
systemctl enable iptables
systemctl restart iptables

systemctl stop NetworkManager 
systemctl disable NetworkManager 
systemctl restart network



sudo mkdir -p /etc/tinc/rzrvpn/hosts
cat <<EOF >/etc/tinc/rzrvpn/tinc.conf
Name = bootstrap
AddressFamily = ipv4
Interface = tun99
ConnectTo = razorserver2
EOF

cat <<EOF >/etc/tinc/rzrvpn/hosts/bootstrap
Subnet = 10.9.2.2/32
EOF

#tincd -n rzrvpn -K4096				/* тут нужно два раза Enter нажать (использовать expect?)
openssl genrsa -out  /etc/tinc/rzrvpn/rsa_key.priv 4096
chmod 0600 /etc/tinc/rzrvpn/rsa_key.priv
openssl rsa -in /etc/tinc/rzrvpn/rsa_key.priv -pubout -RSAPublicKey_out>>/etc/tinc/rzrvpn/hosts/bootstrap
#push public key to server

cat <<EOF >/etc/tinc/rzrvpn/tinc-up
ifconfig \$INTERFACE 10.9.2.2 netmask 255.255.0.0
EOF

cat <<EOF >/etc/tinc/rzrvpn/tinc-down
ifconfig \$INTERFACE down
EOF

chmod 755 /etc/tinc/rzrvpn/tinc-*


echo rzrvpn >/etc/tinc/nets.boot

#scp root@razorserver2:/etc/tinc/rzrvpn/hosts/razorserver2 /etc/tinc/rzrvpn/hosts/
#scp /etc/tinc/rzrvpn/hosts/bootstrap root@razorserver2:/etc/tinc/rzrvpn/hosts/


cat <<EOF >/etc/systemd/system/tinc-rzrvpn.service
[Unit]
Description=tinc rzrvpn
After=network.target

[Service]
Type=forking
ExecStart=/usr/sbin/tincd -n rzrvpn

[Install]
WantedBy=multi-user.target
EOF
systemctl enable tinc-rzrvpn
systemctl start tinc-rzrvpn


) 1>/root/post_install.log 2>&1


%end









