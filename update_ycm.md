cd  ~/.vim/bundle/YouCompleteMe
git clean -f
git pull
git submodule update --recursive --init
./install.py --clang-completer
