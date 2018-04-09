#!/bin/bash

sudo apt-get update
sudo apt install -y cmake g++ git htop pkg-config libopenblas-dev libopencv-dev libboost-all-dev

sudo chown -R `whoami`:`whoami` /opt
cd /opt

wget https://repo.continuum.io/archive/Anaconda3-5.0.0-Linux-x86_64.sh
echo "bb2656314d22aecae6af243ddbbfb32c Anaconda3-5.0.0-Linux-x86_64.sh" | md5sum -c && exit
bash Anaconda3-5.0.0-Linux-x86_64.sh

source ~/.bashrc

#enter x3

### XGBoost
cd /opt
git clone --recursive https://github.com/dmlc/xgboost; cd xgboost
make -j4
cd python-package
python setup.py install

### LightGBM
cd /opt
git clone --recursive https://github.com/Microsoft/LightGBM ; cd LightGBM
mkdir build ; cd build
cmake ..
make -j4
cd ../python-package
python setup.py install

### Catboost
pip --no-cache-dir install https://github.com/catboost/catboost/releases/download/v0.5.2/catboost-0.5.2-cp36-none-manylinux1_x86_64.whl

### tf-cnnvis
cd /opt
git clone https://github.com/InFoCusp/tf_cnnvis.git
cd tf_cnnvis
python setup.py install
python setup.py clean

### MxNet
#cd /opt
#git clone --recursive https://github.com/apache/incubator-mxnet.git mxnet --branch 0.12.0; cd mxnet
#make -j $(nproc) USE_OPENCV=1 USE_BLAS=openblas
#python setup.py install


### tensorflow & keras
#conda install -c conda-forge -y tensorflow 
pip --no-cache-dir install https://github.com/mind/wheels/releases/download/tf1.4-cpu/tensorflow-1.4.0-cp36-cp36m-linux_x86_64.whl
conda install -c conda-forge -y keras==2.0.9

### others
pip install hyperopt==0.1
pip install xgbfir==0.3.1
pip install graphviz==0.8.1

pip install scikit-image==0.13.1

### dlib
cd /opt
git clone https://github.com/davisking/dlib ; cd dlib
#mkdir build; cd build; cmake .. -DUSE_AVX_INSTRUCTIONS=1; cmake --build .
#cd ..
python setup.py install --yes USE_AVX_INSTRUCTIONS


pip install pandas_profiling==1.4.0
pip install mpld3==0.3








