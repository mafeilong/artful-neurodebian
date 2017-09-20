BootStrap: debootstrap
OSVersion: buster
MirrorURL: http://ftp.us.debian.org/debian/
# MirrorURL: http://smaug.datalad.org:3142/debian/


%runscript
    /bin/bash

%post
    apt-get update

    apt-get install -y --no-install-recommends wget tree emacs-nox ca-certificates
    apt-get install -y --no-install-recommends locales tzdata
    cat /usr/share/i18n/SUPPORTED | grep en_US >> /etc/locale.gen
    locale-gen
    update-locale LANG=en_US.UTF-8

    apt-get install -y --no-install-recommends gnupg dirmngr

    # NeuroDebian
    wget -O- http://neuro.debian.net/lists/buster.us-nh.full | tee /etc/apt/sources.list.d/neurodebian.sources.list
    apt-key adv --recv-keys --keyserver hkp://pool.sks-keyservers.net:80 0xA5D32F012649A5A9

    apt-get update

    mkdir -p /scratch /local-scratch /fastscratch /ihome /idata /apps
    chmod a+rX /scratch /local-scratch /fastscratch /ihome /idata /apps

    wget https://raw.githubusercontent.com/mafeilong/artful-neurodebian/buster/install_packages.sh \
        -O /tmp/install_packages.sh

    wget https://raw.githubusercontent.com/mafeilong/artful-neurodebian/buster/install_python_packages.sh \
        -O /tmp/install_python_packages.sh

    /bin/bash /tmp/install_packages.sh

    wget -O- http://neuro.debian.net/lists/stretch.us-nh.full >> /etc/apt/sources.list.d/neurodebian.sources.list
    echo "deb http://ftp.us.debian.org/debian stretch main" >> /etc/apt/sources.list
    apt-get update

    apt-get install -y fsl-complete
    /bin/bash /tmp/install_packages.sh
    /bin/bash /tmp/install_python_packages.sh

    # apt-get purge -y --auto-remove gcc python-dev
    # apt-get clean
    # rm -rf /var/lib/apt/lists/*

    cd /apps
    curl -s ftp://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/6.0.0/freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.0.tar.gz | tar xz

    echo "Bootstrapping finished."
