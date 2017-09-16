BootStrap: debootstrap
OSVersion: zesty
MirrorURL: http://us.archive.ubuntu.com/ubuntu/


%runscript
    /bin/bash

%post
    sed -i 's/$/ universe/' /etc/apt/sources.list
    apt-get update

    apt-get install -y --no-install-recommends wget tree emacs-nox
    apt-get install -y --no-install-recommends locales tzdata
    locale-gen en_US en_US.UTF-8
    update-locale LANG=en_US.UTF-8
    echo "US/Eastern" | tee /etc/timezone
    dpkg-reconfigure --frontend noninteractive tzdata

    apt-get install -y --no-install-recommends gnupg dirmngr

    # NeuroDebian
    wget -O- http://neuro.debian.net/lists/zesty.us-nh.full | tee /etc/apt/sources.list.d/neurodebian.sources.list
    apt-key adv --recv-keys --keyserver hkp://pool.sks-keyservers.net:80 0xA5D32F012649A5A9

    apt-get update

    mkdir -p /scratch /local-scratch /fastscratch /ihome /idata /apps
    chmod a+rX /scratch /local-scratch /fastscratch /ihome /idata /apps

    wget --no-check-certificate \
        https://raw.githubusercontent.com/mafeilong/artful-neurodebian/zesty/install_packages.sh \
        -O /tmp/install_packages.sh

    /bin/bash /tmp/install_packages.sh

    # echo "deb http://us.archive.ubuntu.com/ubuntu artful main universe" >> /etc/apt/sources.list
    # apt-get update && apt-get upgrade -y python3

    # apt-get purge -y --auto-remove gcc python-dev
    # apt-get clean
    # rm -rf /var/lib/apt/lists/*

    cd /apps
    curl -s ftp://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/6.0.0/freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz | tar xz

    echo "Bootstrapping finished."
