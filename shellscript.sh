#!/bin/bash

# Atualiza o sistema
echo "Atualizando o sistema..."
sudo dnf update -y

# Instala pacotes essenciais
echo "Instalando pacotes essenciais..."
sudo dnf install -y \
    git \
    vim \
    curl \
    wget \
    htop \
    gnome-tweaks \
    neofetch

# Instala codecs de multimídia
echo "Instalando codecs de multimídia..."
sudo dnf install -y \
    gstreamer1-plugins-base \
    gstreamer1-plugins-good \
    gstreamer1-plugins-ugly \
    gstreamer1-ffmpeg

# Adiciona repositórios de terceiros, se necessário (exemplo: RPM Fusion)
echo "Adicionando repositórios RPM Fusion..."
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Instala softwares adicionais do RPM Fusion
echo "Instalando software adicional..."
sudo dnf install -y \
    vlc \
    discord

# Instala o suporte a Flatpak
echo "Instalando suporte a Flatpak..."
sudo dnf install -y flatpak

# Adiciona o repositório Flathub (para aplicativos Flatpak)
echo "Adicionando repositório Flathub..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Instala o suporte a Snap
echo "Instalando suporte a Snap..."
sudo dnf install -y snapd

# Habilita e inicia o serviço do Snap
sudo systemctl enable --now snapd.socket

# Cria um link simbólico para o diretório de aplicativos Snap
sudo ln -s /var/lib/snapd/snap /snap

# Limpa pacotes não utilizados
echo "Limpando pacotes não utilizados..."
sudo dnf autoremove -y

# Finaliza
echo "Pós-instalação concluída! Por favor, reinicie o sistema."
