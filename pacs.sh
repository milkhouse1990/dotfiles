# zsh
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# plugins
sudo pacman -S zsh-syntax-highlighting
sudo pacman -S zsh-autosuggestions

# latex
sudo pacman -S texlive-core
sudo pacman -S texlive-latexextra
# nvim edit
pip install neovim-remote --user

# gfortran
sudo pacman -S gcc-fortran

# To play BS sfc games
sudo pacman -S snes9x
sudo modprobe snd-pcm-oss

# --- Python
# Scrapy
pip install bs4 --user
pip install lxml --user
pip install pandas --user
# lint
pip install pylint --user
