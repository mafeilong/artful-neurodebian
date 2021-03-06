pip_packages=(
    numpy
    scipy
    matplotlib
    pandas
    sympy
    nose
    nibabel
    future
    seaborn
    joblib
    pprocess
    psutil
    tables
    mpi4py
    pip
    setuptools
    wheel
    shogun
    statsmodels
    pymvpa2
    surfer
    nitime
    distributed
    dask
    scikit-learn
    nipy
    nipype
    nilearn
    dicom
    dcmstack
    configparser
    funcsigs
    pytest
)
for package in "${pip_packages[@]}"; do
    for pip in pip2 pip3; do
        $pip install $package || true
    done
done
