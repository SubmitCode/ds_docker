# DS Docker

## Task List
- [x] create first working version
- [ ] Test offline installation
- [ ] Open a pull request

## Preparation
### Password 
If you want to setup a password without a token please follow the [Instructions](https://jupyter-notebook.readthedocs.io/en/stable/public_server.html). Right now the hashed password is `Testuser`.

### jupyter_notebook_config.py
set the proper `c.NotebookApp.port = 8005`

## Instructions for offline installation
1. On your machine with internet access run
    ```
    cd cpu_docker_gkb
    docker run -d --rm --name cpu_anaconda -p 8005:8005 -v //C/research/test:/research -v //c/research/data:/research/data docker_cpu_anaconda    
    ```
    This will create the image you need.

2. Next you run 
    Here some links for the dockumentation on docker.com. 
    ([save Docker](https://docs.docker.com/engine/reference/commandline/save/), [load Docker](https://docs.docker.com/engine/reference/commandline/load/))
    ```
    docker export docker_cpu_anaconda > docker_cpu_anaconda.tar
    ```
    Copy the docker to the offline location. There you have to
    uncompress the tar file with the software availiable. 
    ```
    xz -9 cpu_docker_anaconda.tar
    docker load < cpu_docker_gkb.tar.xz
    ```
    
3. Run the docker
    ```
    docker run -d --name cpu_anaconda -p 8005:8005 -v C:\research\test:/research -v c:\research\data:/research/data  cpu_docker_anaconda 
    ```
    