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

rootpw --iscrypted $6$HqS6tEQZKMzZXRqT$T1dmqcISnQQtVR.u/Sh56jKr75bS2JwZe20PddB/Ab1kT3391igLp8AA5VX5vlhbl8WJHtMKyMlrxeHB7ghjK1
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
ssh-rsa ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDn8IrSHYNdHAnQ8uCr/h0jZQyAJVpJWPdsv9deWlJzEDtJjdnWZqdfS21bJa/hMdQZGuDKdfkQjwJhVXabHrioo9bztYGcLNmq1+5HZRaXqX8vGZrqT8y+mqyAVT9nsn6gsy6pc13cHjSudsTozgpishbLXmuz/vfqrUCFd2JTDcQ+vmdhA5MM/WxUz9pCRscDU440GPyejWvjuOjQOyNhE1zZOt+DK26QOivcXHXbGBDo2kukNYDR9bpfl2aCgERUKvrGugKtAW5YhsTSeN0HVd7J1fRljd7GROJ4R5lmyqh4I1rBM+IvOIfIKcUk1wJ++DpAUHzKI8Jb4QFvoTg3CXs0sP4GMpIPoeGYLkeowQUxL2J2UZmwV5IRB6iAjJOhOR4BZ5o7p4SmBcaITAHjSXHKwvAApZcVUzTlh5/6DlqpL303tG3clgy/jGJPHJloKalQVVc9p4vT2P6SJzsJ75hy13KuDY5KCfbuzBe0dHBSK7v/CHangEmDWAWFmwf3tn2Ikb+rgnNkB6D/xpplvfoGuTZWjIKdv4oBNelIsvZm3o0nE3xkWJucFup0xUhvcQQlbxDtyqRPpEpY2V8K5VMaLFQ2XhvRHAAWoSIkvE+k8yjQsm7Z5G/71Z52lD9sMNg4Gr+LJyrvOWPIApuuuW8dKp0zqiZP63mEmDZuJw== no@no.com
PUBLIC_KEY
chmod 600 .ssh/authorized_keys
) 1>/root/post_install.log 2>&1

%end
