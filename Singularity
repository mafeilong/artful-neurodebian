BootStrap: debootstrap

OSVersion: zesty
MirrorURL: http://us.archive.ubuntu.com/ubuntu/

# OSVersion: stretch
# MirrorURL: http://ftp.us.debian.org/debian/
# MirrorURL: http://smaug.datalad.org:3142/debian/


%runscript
    /bin/bash

%post
    sed -i 's/$/ universe/' /etc/apt/sources.list
    apt-get update

    apt-get install -y --no-install-recommends gnupg dirmngr
    apt-get install -y --no-install-recommends wget ca-certificates

    # NeuroDebian
    wget -O- http://neuro.debian.net/lists/zesty.us-nh.full | tee /etc/apt/sources.list.d/neurodebian.sources.list
    apt-key adv --recv-keys --keyserver hkp://pool.sks-keyservers.net:80 0xA5D32F012649A5A9
