BootStrap: docker
From: neurodebian:artful-non-free

%runscript
    /bin/bash

%post
    apt-get update

    apt-get install -y --no-install-recommends wget tree emacs-nox ca-certificates
    apt-get install -y --no-install-recommends locales tzdata
    cat /usr/share/i18n/SUPPORTED | grep en_US >> /etc/locale.gen
    locale-gen
    update-locale LANG=en_US.UTF-8

    mkdir -p /scratch /local-scratch /fastscratch /ihome /idata /apps /data /scripts /results
    chmod a+rX /scratch /local-scratch /fastscratch /ihome /idata /apps /data /scripts /results

    wget https://raw.githubusercontent.com/mafeilong/artful-neurodebian/artful/install_packages.sh \
        -O /tmp/install_packages.sh

    wget https://raw.githubusercontent.com/mafeilong/artful-neurodebian/artful/install_python_packages.sh \
        -O /tmp/install_python_packages.sh

    /bin/bash /tmp/install_packages.sh

    apt-get install -y fsl-complete
    /bin/bash /tmp/install_packages.sh
    /bin/bash /tmp/install_python_packages.sh

    rm /usr/bin/python
    ln -s python3 /usr/bin/python

    # apt-get clean
    # rm -rf /var/lib/apt/lists/*

    cd /apps
    curl -s ftp://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/6.0.1/freesurfer-Linux-centos6_x86_64-stable-pub-v6.0.1.tar.gz | tar xz

    echo "Bootstrapping finished."
    echo "Please copy your FreeSurfer license to /apps/freesurfer"
