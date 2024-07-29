#!/bin/bash

set -e

eval "$(conda shell.bash hook)"

conda init
source ../.bashrc

sudo apt-get update -y 
sudo ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime
sudo apt-get install -y libgl1-mesa-glx
sudo apt-get install -y libglib2.0-0

conda create -n huggingface python==3.10 -y
conda activate huggingface 
conda install anaconda::ipywidgets -y 
conda install ipykernel -y
python -m ipykernel install --user --name huggingface

pip install transformers 
pip install datasets 
pip install timm
pip install evaluate 
pip install accelerate 
pip install pillow 
pip install scikit-learn
pip3 install torch torchvision torchaudio
pip install diffusers["torch"] transformers
pip install --force-reinstall charset-normalizer==3.1.0
conda install anaconda::numpy -y 
conda install plotly::plotly -y 
conda install -c conda-forge matplotlib -y 
conda install anaconda::pandas -y
pip install ipyplot==1.1.0 ftfy 
pip install jiwer
pip install opencv-python
pip install bitsandbytes

conda deactivate