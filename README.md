# course_env
Environemnt for course: practical machine learning

## Docker [latest]

Pull or build docker images:
docker pull dataworkshop-env
docker build -t dataworkshop-env .

Run docker container:
docker run -d --name dataworkshop-notebook -v /path/to/modules/:/home/workspace/modules/ -p 8888:8888 dataworkshop-env
Check token:
docker logs dataworkshop-notebook

Open browser and goto:
localhost:8888 or another remote host address

Enjoy!
