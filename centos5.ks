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

chmod 600 .ssh/authorized_keys
) 1>/root/post_install.log 2>&1

%end
