#!/bin/bash

sudo apt-get update
sudo apt install -y cmake g++ git htop pkg-config libopenblas-dev libopencv-dev libboost-all-dev

sudo chown -R `whoami`:`whoami` /opt
cd /opt


wget https://repo.continuum.io/archive/Anaconda3-5.3.1-Linux-x86_64.sh
echo "334b43d5e8468507f123dbfe7437078f Anaconda3-5.3.1-Linux-x86_64.sh" | md5sum -c
bash Anaconda3-5.3.1-Linux-x86_64.sh

export PATH="$HOME/anaconda3/bin:$PATH"

## Configure jupyter
jupyter notebook --generate-config
sed -i -e "s/#c.NotebookApp.allow_origin = ''/c.NotebookApp.allow_origin = '*'/g" $HOME/.jupyter/jupyter_notebook_config.py
sed -i -e "s/#c.NotebookApp.ip = 'localhost'/c.NotebookApp.ip = '0.0.0.0'/g" $HOME/.jupyter/jupyter_notebook_config.py

#update pip
pip install --upgrade pip

### XGBoost
cd /opt
git clone --recursive https://github.com/dmlc/xgboost; cd xgboost
make
cd python-package
python setup.py install

### LightGBM
cd /opt
git clone --recursive https://github.com/Microsoft/LightGBM ; cd LightGBM
mkdir build ; cd build
cmake ..
make
cd ../python-package
python setup.py install
python setup.py clean

### Catboost
pip install catboost=0.12.2

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
#pip --no-cache-dir install https://github.com/mind/wheels/releases/download/tf1.7-cpu/tensorflow-1.7.0-cp36-cp36m-linux_x86_64.whl
#conda install -c conda-forge -y keras==2.1.5
conda install tensorflow
conda install keras

### others
pip install hyperopt==0.1.1
pip install xgbfir==0.3.1
pip install graphviz==0.8.1
pip install livelossplot==0.3.0
pip install rfpimp==1.3
pip install eli5==0.8.1
pip install scikit-plot==0.3.7
pip install deepreplay==0.1.1a2

pip install scikit-image==0.13.1

### dlib
cd /opt
git clone https://github.com/davisking/dlib ; cd dlib
#mkdir build; cd build; cmake .. -DUSE_AVX_INSTRUCTIONS=1; cmake --build .
#cd ..
python setup.py install --yes USE_AVX_INSTRUCTIONS


pip install pandas_profiling==1.4.0
pip install mpld3==0.3
