#!/bin/bash

# Atualiza o sistema
echo "Atualizando o sistema..."
sudo dnf update -y

# Instala pacotes essenciais
echo "Instalando pacotes essenciais..."
sudo dnf install -y git vim curl

# Adiciona repositórios RPM Fusion
echo "Adicionando repositórios RPM Fusion..."
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Instala suporte a Flatpak e Snap
echo "Instalando suporte a Flatpak e Snap..."
sudo dnf install -y flatpak
sudo dnf install -y snapd

# Instala codecs de multimídia
echo "Instalando codecs de multimídia..."
sudo dnf install -y gstreamer1-plugins-* ffmpeg

# Instala aplicativos comuns
echo "Instalando aplicativos comuns..."
sudo dnf install -y gimp libreoffice vlc firefox

# Limpa pacotes não utilizados
echo "Limpando pacotes não utilizados..."
sudo dnf autoremove -y

echo "Configuração concluída!"
