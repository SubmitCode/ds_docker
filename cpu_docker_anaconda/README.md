# DS Docker

## Task List
- [x] create first working version
- [x] Test offline installation

## Preparation
### Password 
If you want to setup a password without a token please follow the [Instructions](https://jupyter-notebook.readthedocs.io/en/stable/public_server.html). Right now the hashed password is `Testuser`.

### jupyter_notebook_config.py
set the proper `c.NotebookApp.port = 8005`

## create image
1. `cd cpu_docker_anaconda` 

2. `docker build --rm . -t cpu_anaconda:latest`

3. `docker save -o <path to storage folder>\<filename>.tar cpu_anaconda:latest` [save Docker](https://docs.docker.com/engine/reference/commandline/save/)

3. transfer the tar file to the target location

## Instructions for offline installation
1. On your machine with internet access run
    ```
    cd cpu_docker_anaconda
    docker run -d --rm --name cpu_anaconda -p 8005:8005 -v //C/research/test:/research -v //c/research/data:/research/data cpu_anaconda    
    ```
    This will create the image you need.

2. Next you run 
    Here some links for the dockumentation on docker.com. 
    ([load Docker](https://docs.docker.com/engine/reference/commandline/load/))
    if case you have a multipart file run first `cat image.zip* > ~/docker_images/image.zip`
    ```
    
    unzip image.zip
    docker save -o <path where image.tar should be saved> docker_cpu_anaconda
    ```
    Copy the docker to the offline location. There you have to
    uncompress the tar file with the software availiable. 
    ```
    docker load -i <path to image tar file>
    ```
    
3. Run the docker
    ```
    docker run -d --name cpu_anaconda -p 8005:8005 -v C:\research\test:/research -v c:\research\data:/research/data  cpu_anaconda 
    ```
    
