#!/bin/bash

apt-get update

packages=(
    python
    python3
    ipython
    ipython3
    jupyter-notebook
    jupyter-nbextension-jupyter-js-widgets
    swig
    libdpkg-perl
    python3.6-dev
    g++
    git
    git-annex
    connectome-workbench
    ants
    dcm2niix
    afni
    heudiconv
    convert3d
    gcc
    fsleyes
    mricron
)

install_package () {
    pkg=$1
    wc1=`apt-cache policy $pkg | wc -l`
    wc2=`apt-cache policy $pkg | grep "Candidate: (none)" | wc -l`
    if  [ $wc1 -gt 0 ] && [ $wc2 -eq 0 ] ; then
        echo "$pkg"
    fi
}

python_packages=(
    numpy
    scipy
    matplotlib
    pandas
    sympy
    nose
    nibabel
    future
    h5py
    seaborn
    joblib
    pprocess
    psutil
    tables
    mpi4py
    pip
    setuptools
    wheel
    vtk6
    shogun
    statsmodels
    mvpa2
    mvpa2-lib
    surfer
    nitime
    distributed
    dask
    dev
    sklearn
    sklearn-lib
    pymc
    nipy
    nipype
    nilearn
    dicom
    dcmstack
    configparser
    funcsigs
    pytest
    ipykernel
    ipywidgets
    widgetsnbextension
)

TODO=""

for pkg in "${packages[@]}"; do
    pkg=`install_package $pkg`
    TODO="$TODO $pkg"
done

for package in "${python_packages[@]}"; do
    for py in python python3; do
        pkg=${py}-${package}
        pkg=`install_package $pkg`
        TODO="$TODO $pkg"
    done
done

apt-get install -y --no-install-recommends $TODO
