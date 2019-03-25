#!/bin/bash
source activate fastai 
cd /research 
/code-server/code-server-1.32.0-310-linux-x64/code-server --data-dir=/code-server --cert-key=/code-server/privkey.pem --cert=/code-server/fullchain.pem & \
jupyter notebook --allow-root 

