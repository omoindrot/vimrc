sudo apt update
sudo add-apt-repository -y ppa:jonathonf/vim
sudo apt update
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y \
    software-properties-common \
    vim \
    python3.7 \
    python3.7-dev \
    python3-pip \
    python3.7-venv \
    openslide-tools \
    python3-openslide \
    zip \
    unzip
