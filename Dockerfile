# FROM ubuntu:latest
FROM nvcr.io/nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

RUN apt-get update && apt-get install -y wget git git-lfs libglib2.0-0 libsm6 libxrender1 libxext-dev

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    sh Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda3 && \
    rm -r Miniconda3-latest-Linux-x86_64.sh

ENV PATH /opt/miniconda3/bin:$PATH

RUN git clone https://github.com/CompVis/stable-diffusion && \
    cd stable-diffusion && \
    conda init bash && \
    conda env create -f environment.yaml && \
    echo "conda activate ldm" >> ~/.bashrc