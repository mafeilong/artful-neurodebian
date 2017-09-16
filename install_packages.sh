#!/bin/bash

apt-get update

packages=(
    python
    python3
    ipython
    ipython3
    jupyter-notebook
    git
    git-annex
    datalad
    connectome-workbench
    ants
    dcm2niix
    afni
    fsl-complete
    heudiconv
    convert3d
    gcc
)

install_package () {
    pkg=$1
    wc1=`apt-cache policy $pkg | wc -l`
    wc2=`apt-cache policy $pkg | grep "Candidate: (none)" | wc -l`
    if  [ $wc1 -gt 0 ] && [ $wc2 -eq 0 ] ; then
        apt-get install -y --no-install-recommends $pkg || true
    fi
    return 0
}

for pkg in "${packages[@]}"; do
    install_package $pkg
done

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
    nilearn
    datalad
    dicom
)

for package in "${python_packages[@]}"; do
    for py in python python3; do
        pkg=${py}-${package}
        install_package $pkg
    done
done
