FROM mcr.microsoft.com/devcontainers/universal:2-linux

# config fish as default shell
RUN chsh -s /usr/bin/fish

# install oh-my-fish
RUN curl -L https://get.oh-my.fish | fish

# reload fish shell
RUN fish -c "omf install agnoster"
