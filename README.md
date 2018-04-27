# Course environment
Environemnt for course: [practical machine learning](http://dataworkshop.eu)

There're at least two domensions how to setup environemnt: *physical* and *logical*.

### Physical 
1. local machine (e.g. laptop)
2. cloud (e.g. [Google Cloud](https://github.com/dataworkshop/gcloud_setup) or [Amazon](https://github.com/dataworkshop/amazon_setup))
3. hybrid

### Logical
1. **bash script** - install one by one (e.g. using `setup.sh`)
2. **docker** 

## Bash script
1. Prepare a machine (the script tested on Ubuntu 16.04)
2. Login to machine via ssh
3. Download bash script: `wget https://raw.githubusercontent.com/dataworkshop/course_env/master/setup.sh`
4. Run it: `bash setup.sh`
5. It took some time (be patient)
6. Test it.
7. Be happy :)

## Jupyter
To run jupyter you should remeber about few things:
1. first of all open a port (e.g. 8889). You can find some details how to open ports for [Google Cloud](https://github.com/dataworkshop/gcloud_setup) or [Amazon](https://github.com/dataworkshop/amazon_setup)
2. You need run jupyter's process in smart way (when you logout the process should still exists). For this you can use e.g. screen. When you type: `screen -S jupyter` you will create a session. After you you can run some command there. To detach session: `CTRL + A + D`. To attach: `screen -x jupyter`. *Note*, `jupyter` it's just a name for this case, it can be something else (e.g. `elephant`).
3. To run jupyter's notebooks, type this command: `jupyter notebook --no-browser --port 8889`. Remeber about token.


## Docker [latest]

Pull or build docker images:
1. `docker pull dataworkshop-env`
2. `docker build -t dataworkshop-env .`

### Run docker container:
1. `docker run -d --name dataworkshop-notebook -v /path/to/modules/:/home/workspace/modules/ -p 8888:8888 dataworkshop-env`

#### Check token:
2. `docker logs dataworkshop-notebook`

### Open browser and goto:
`localhost:8888` or another remote host address
