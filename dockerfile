FROM ubuntu:16.04

ENV PATH="/root/anaconda3/bin:$PATH"

RUN apt-get update && \
    apt install -y \
        vim wget cmake g++ git htop pkg-config libopenblas-dev libopencv-dev libboost-all-dev && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

RUN chown -R `whoami`:`whoami` /opt

RUN wget --quiet https://repo.continuum.io/archive/Anaconda3-5.0.0-Linux-x86_64.sh -P /opt
RUN echo "bb2656314d22aecae6af243ddbbfb32c /opt/Anaconda3-5.0.0-Linux-x86_64.sh" | md5sum -c
RUN bash /opt/Anaconda3-5.0.0-Linux-x86_64.sh -b -u && \
    rm /opt/Anaconda3-5.0.0-Linux-x86_64.sh

RUN echo 'export PATH=/root/anaconda3/bin:$PATH' > /etc/profile.d/anaconda3.sh

### XGBoost
RUN git clone --recursive https://github.com/dmlc/xgboost /opt/xgboost
WORKDIR /opt/xgboost
RUN make -j4
WORKDIR /opt/xgboost/python-package
RUN python setup.py install

### LightGBM
RUN git clone --recursive https://github.com/Microsoft/LightGBM /opt/LightGBM
RUN mkdir /opt/LightGBM/build
WORKDIR /opt/LightGBM/build
RUN cmake ..
RUN make -j4
WORKDIR /opt/LightGBM/python-package
RUN python setup.py install

### Catboost
WORKDIR /opt/
RUN pip --no-cache-dir install https://pypi.python.org/packages/86/f8/432670972b891aebf872d6b705f02e269c8d83ff3b3e948a7d1c4722c4cd/catboost-0.5.2-cp36-none-manylinux1_x86_64.whl#md5=88b4ffb53d2767f779effb22e5d5d3cc

### tensorflow & keras
WORKDIR /opt/
RUN pip --no-cache-dir install https://github.com/mind/wheels/releases/download/tf1.4-cpu/tensorflow-1.4.0-cp36-cp36m-linux_x86_64.whl
RUN conda install -c conda-forge -y keras==2.0.9

### dlib
RUN git clone https://github.com/davisking/dlib /opt/dlib
WORKDIR /opt/dlib
RUN python setup.py install --yes USE_AVX_INSTRUCTIONS

### others
RUN pip install hyperopt==0.1
RUN pip install xgbfir==0.3.1
RUN pip install graphviz==0.8.1
RUN pip install scikit-image==0.13.1
RUN pip install pandas_profiling==1.4.0
RUN pip install mpld3==0.3
RUN pip install opencv-python
RUN pip install tqdm

RUN mkdir /home/workspace/

WORKDIR /home/workspace/

RUN chmod 777 -R ./

CMD jupyter notebook --ip=0.0.0.0 --allow-root
