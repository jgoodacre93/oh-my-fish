FROM ohmyfish/fish:4.8.1

COPY . /src/oh-my-fish

RUN fish /src/oh-my-fish/bin/install --local-source --noninteractive --yes
