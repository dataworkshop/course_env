# course_env
Environemnt for course: practical machine learning

## Docker [dev]

Run docker container:
docker run -d -p 8080:8080 -v /path/to/modules/:/home/my_workspace/ --name dataworkshop-env bsekiewicz/dataworkshop-enviroment:dev

Run jupyter notebook in containter:
docker exec -it dataworkshop-env bash
cd /home/my_workspace/
jupyter notebook --ip=0.0.0.0 --port=8080 --allow-root

Open browser and goto:
localhost:8080 or another remote host addres
