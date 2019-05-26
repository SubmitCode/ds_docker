FROM nvidia/cuda:9.2-base-ubuntu16.04
# See http://bugs.python.org/issue19846
ENV LANG C.UTF-8
LABEL com.nvidia.volumes.needed="nvidia_driver"

RUN echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1604/x86_64 /" > /etc/apt/sources.list.d/nvidia-ml.list

RUN apt-get update && apt-get install -y --no-install-recommends \
         build-essential \
         cmake \
         git \
         curl \
         vim \
         ca-certificates \
         python-qt4 \
         libjpeg-dev \
         zip \
         unzip \
         openssl \
         net-tools \
         locales \
         wget \
         openssh-server \
         libpng-dev &&\
     rm -rf /var/lib/apt/lists/*

ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64
ENV PYTHON_VERSION=3.6

RUN curl -o ~/miniconda.sh -O  https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
     chmod +x ~/miniconda.sh && \
     ~/miniconda.sh -b -p /opt/conda && \
     rm ~/miniconda.sh && \
    /opt/conda/bin/conda install conda-build

ENV PATH=$PATH:/opt/conda/bin/
ENV USER fastai

# Create Enviroment
COPY enviroment.yaml /enviroment.yaml
RUN conda env create -f enviroment.yaml

# copy jupyter config and certificate
COPY jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py
COPY keys/privkey.pem /root/.jupyter/privkey.pem
COPY keys/cert.pem /root/.jupyter/cert.pem

# Activate Source
#CMD source activate fastai
CMD source ~/.bashrc

WORKDIR /research
RUN chmod -R a+w /research

COPY run.sh /run.sh

CMD ["/run.sh"]
