# docker run --runtime nvidia --shm-size 48G -d -p 9999:9999 -v /media/wilhelm/Data:/poo_detector/data -v /home/wilhelm/research/poo_detector/:/poo_detector fastai-custom
docker run --runtime nvidia --shm-size 48G -d -p 9999:9999 -p 8443:8443 -v /media/wilhelm/Data:/research/data -v /home/wilhelm/research/:/research ds_docker:latest

