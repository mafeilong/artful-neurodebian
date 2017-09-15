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
for pkg in "${packages[@]}"; do
    if apt-cache show $pkg &> /dev/null; then
        apt-get install -y --no-install-recommends $pkg
    fi
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
        if apt-cache show $pkg &> /dev/null; then
            apt-get install -y --no-install-recommends $pkg
        fi
    done
done
