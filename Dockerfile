FROM paperist/texlive-ja:latest
ENV PATH=/usr/local/bin/texlive:$PATH
ENV HOME=/root
WORKDIR /workdir
RUN apt-get update \
  && apt-get install -y \
    perl cpanminus carton gcc nodejs \
    git wget \
    groff \
    inkscape ghostscript fig2dev \
    bmake \
    less \
  && rm -rf /var/lib/apt/lists/*
RUN cpanm -nq \
    https://github.com/kaz-utashiro/App-Greple-fbsd2.git
COPY inputrc $HOME/.inputrc
CMD [ "bash" ]
