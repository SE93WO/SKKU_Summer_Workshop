#!/bin/bash

set -e

eval "$(conda shell.bash hook)"

sudo apt-get update
sudo ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime
sudo apt-get install -y libsm6 libxext6 ffmpeg zip 

conda create -n tabular python==3.10 -y
conda activate tabular
conda install anaconda::ipywidgets -y 
conda install ipykernel -y
python -m ipykernel install --user --name tabular 
pip install autogluon.eda
conda deactivate

conda create -n cv python==3.10 -y
conda activate cv
pip install -U pip
pip install -U setuptools wheel
conda install anaconda::ipywidgets -y 
conda install ipykernel -y
python -m ipykernel install --user --name cv 
pip install autogluon==1.1.0
mim install mmcv==2.1.0
pip install mmdet
conda install numpy -y 
conda deactivate
