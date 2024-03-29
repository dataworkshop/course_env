#!/bin/bash

sudo apt-get update
sudo apt install -y cmake g++ git wget htop pkg-config libopenblas-dev libopencv-dev libboost-all-dev python-dev python3-dev default-libmysqlclient-dev

sudo chown -R `whoami`:`whoami` /opt
cd /opt

## Anaconda install
wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh
echo "25e3ebae8905450ddac0f5c93f89c467 Anaconda3-2021.05-Linux-x86_64.sh" | md5sum -c
bash Anaconda3-2021.05-Linux-x86_64.sh -b

echo 'export PATH="$HOME/anaconda3/bin:$PATH"' > ~/.bash_profile
source ~/.bash_profile

## Configure jupyter
jupyter notebook --generate-config
sed -i -e "s/#c.NotebookApp.allow_origin = ''/c.NotebookApp.allow_origin = '*'/g" $HOME/.jupyter/jupyter_notebook_config.py
sed -i -e "s/#c.NotebookApp.ip = 'localhost'/c.NotebookApp.ip = '0.0.0.0'/g" $HOME/.jupyter/jupyter_notebook_config.py

#update pip
pip install --upgrade pip

# setup opt directory
sudo chown -R $USER /opt
cd /opt

### install GBM
conda install -c conda-forge -y xgboost=1.3.0
conda install -c conda-forge -y catboost=0.23.2
conda install -c conda-forge -y lightgbm=2.3.0


### tensorflow & keras
#pip --no-cache-dir install https://github.com/mind/wheels/releases/download/tf1.7-cpu/tensorflow-1.7.0-cp36-cp36m-linux_x86_64.whl
#conda install -c conda-forge -y keras==2.1.5

conda install -y tensorflow=1.14


conda install -c conda-forge -y tqdm
conda install -c conda-forge category_encoders
conda install -c conda-forge -y imbalanced-learn
conda install -y gensim=3.4.0
conda install -y mysqlclient
conda install -y sqlalchemy

conda install -y pandas
conda install -y qgrid
conda install -y numpy=1.15.4
conda install -y openssl=1.0.2p

### others
pip install hyperopt==0.1.1
pip install xgbfir==0.3.1
pip install graphviz==0.8.1
pip install livelossplot==0.3.0
pip install rfpimp==1.3
pip install eli5==0.8.1
pip install scikit-plot==0.3.7
pip install deepreplay==0.1.1a2
pip install hyperas==0.4.1
pip install albumentations==0.2.2
pip install clint
pip install modin
pip install modin[all]
pip install ml_metrics

### dlib
cd /opt
git clone https://github.com/davisking/dlib ; cd dlib
#mkdir build; cd build; cmake .. -DUSE_AVX_INSTRUCTIONS=1; cmake --build .
#cd ..
python setup.py install --yes USE_AVX_INSTRUCTIONS

pip install pandas_profiling==1.4.0
pip install mpld3==0.3

# source .bashrc  # or  source anaconda3/bin/activate
# python check_libraries.py
